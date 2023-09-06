/// <reference path="globals.js" />
/// <reference path="edfiadmin.auth.js" />
// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

/*global EdFiAdmin*/
var Sandbox = function (sandboxType, dedicated) {
    this.sandboxType = sandboxType;
    this.dedicated = dedicated;
    this.value = function () {
        switch (this.sandboxType) {
            case "minimal":
                return 1;
            case "sample":
                return 2;
            default:
                return 0;
        }
    };
};

var ModalController = function (modalOptions) {
    var self = this;

    this.callback = null;
    this.confirmChecked = ko.observable(false);

    var getModal = function () {
        return $('#' + modalOptions.htmlId);
    };

    var getWaitSpinner = function () {
        return $('#' + modalOptions.htmlId + ' .wait-spinner');
    };

    var showWait = function () {
        getWaitSpinner().removeClass('d-none');
    };

    var hideWait = function () {
        getWaitSpinner().addClass('d-none');
    };

    this.show = function (onOk) {
        self.callback = onOk;
        self.confirmChecked(false);
        hideWait();

        getModal().modal('show');
    };

    this.hide = function () {
        getModal().modal('hide');
    };

    this.onOkClicked = function () {
        if (modalOptions.closeOnOk) {
            self.hide();
            self.callback();
        } else {
            showWait();
            self.callback(self.hide);
        }
    };

    getModal().modal({ show: false, backdrop: 'static', keyboard: false });
};

var ConfirmationDialog = function () {
    var self = this;

    this.htmlId = "modal-confirm";
    var modal = new ModalController({ htmlId: self.htmlId });

    this.message = ko.observable("");
    this.buttonText = ko.observable("");

    this.disableOkButton = ko.computed(function () {
        return !modal.confirmChecked();
    });
    this.onOkClicked = modal.onOkClicked;
    this.confirmChecked = modal.confirmChecked;

    this.show = function (options) {
        self.message(options.message);
        self.buttonText(options.buttonText);

        modal.show(options.callback);
    };
};

var TokenDialog = function () {
    var self = this;

    this.htmlId = "modal-token";
    var modal = new ModalController({ htmlId: self.htmlId });

    this.message = ko.observable("");

    this.show = function (options) {
        self.message(options.message);
        modal.show(options.callback);
    };
};

var ResetDialog = function () {
    var self = this;

    this.htmlId = "modal-reset";
    var modal = new ModalController({ htmlId: self.htmlId });

    this.message = ko.observable("");

    this.show = function (options) {
        self.message(options.message);
        modal.show(options.callback);
    };
};

var AddApplicationDialog = function () {
    var self = this;

    self.applicationName = ko.observable('');
    self.useSampleData = ko.observable(false);
    self.canAdd = ko.computed(function () {
        return self.applicationName().length > 0;
    });

    self.htmlId = "modal-add";
    var modal = new ModalController({ htmlId: self.htmlId });
    this.onOkClicked = modal.onOkClicked;

    this.show = function (options) {
        self.applicationName('');
        self.useSampleData(false);
        modal.show(options.callback);
    };
};

var ClientViewModel = function (data) {
    var self = this;
    ko.mapping.fromJS(data, {}, this);
    this.HasSampleData = ko.computed(function () {
        return self.SandboxTypeName() == "Sample" ? 'Yes' : 'No';
    });
};

var IsFullyLoaded = function (data) {
    var retval = true;
    $.each(data, function (i, item) {
        if (item.IsLoading) {
            retval = false;
        }
    });
    return retval;
}

function ClientsViewModel() {
    var self = this;
    var clientMapping = {
        create: function (options) {
            return new ClientViewModel(options.data);
        }
    };
    self.apiClients = ko.mapping.fromJS([], clientMapping);
    self.error = ko.observable();
    self.confirmationDialog = new ConfirmationDialog();
    self.addApplicationDialog = new AddApplicationDialog();
    self.tokenDialog = new TokenDialog();
    self.resetDialog = new ResetDialog();

    self.shouldShowTable = ko.computed(function () {
        return self.apiClients().length > 0;
    });

    self.canAddMoreApplications = ko.observable(true);

    self.clientStatus = ko.computed(function () {
        switch (self.apiClients().length) {
            case 0:
                return "You have no sandboxes";
            case 1:
                return "You have 1 sandbox";
            default:
                return "You have " + self.apiClients().length + " sandboxes";
        }

    });

    self.getData = function () {
        $.ajax(
            {
                type: "GET",
                url: EdFiAdmin.Urls.client,
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    ko.mapping.fromJS(data, self.apiClients);
                    if (!IsFullyLoaded(data)) {
                        with (self) { setTimeout(function () { getData(); }, 3000); }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    self.error(errorThrown);
                    return 0;
                },
                statusCode: {
                    302: function () {
                        console.log('302');
                    }
                }
            });
    };

    self.doAddClient = function (onComplete) {
        self.error("");
        var applicationName = self.addApplicationDialog.applicationName();
        var sandboxType = self.addApplicationDialog.useSampleData() ? "sample" : "minimal";
        $.ajax({
            type: "POST",
            data: { "Name": applicationName, "SandboxType": sandboxType, "IsDedicated": true },
            url: EdFiAdmin.Urls.client,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                onComplete();
                var newApplication = new ClientViewModel(data);
                self.apiClients.push(newApplication);
                if (newApplication.IsLoading) {
                    with (self) { setTimeout(function () { getData(); }, 3000); }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                onComplete();
                switch (jqXHR.status) {
                    case 400:
                        self.error("Maximum number of sandboxes reached. Please reuse or delete an existing sandbox.");
                        break;
                    case 406:
                        self.error("You must provide a name for your client application sandbox.");
                        break;
                    default:
                        self.error(textStatus);
                }
                return 0;
            }
        });
    };

    self.updateClientClicked = function (client) {
        var updateClient = function (onComplete) {
            var mydata = ko.mapping.toJS(client);
            $.ajax({
                type: "PUT",
                data: mydata,
                url: EdFiAdmin.Urls.client + "/" + client.Id(),
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    var updatedClient = new ClientViewModel(data);
                    self.apiClients.replace(client, updatedClient);
                    onComplete();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    self.error(errorThrown);
                    onComplete();
                    return 0;
                }
            });
        };
        self.error("");
        self.confirmationDialog.show({
            message: "This operation will permanently change the client secret for this sandbox.  " +
                "Any existing client applications should also be modified to use the new secret." +
                "<br/><br/>" +
                "This operation cannot be undone.",
            buttonText: "Change Secret",
            callback: updateClient
        });
    };

    self.tokenClientClicked = function (client) {
        var mydata = ko.mapping.toJS(client);
        var auth = { Client_id: mydata.Key.toString(), Response_type: "code" };
        $.support.cors = true;

        var token = { Client_id: mydata.Key, Client_secret: mydata.Secret, grant_type: "client_credentials" };
        $.post(EdFiAdmin.Urls.oauth + "token/", token, function (d, e) {
            self.tokenDialog.show({
                message: (d.Access_token || d.access_token),
                buttonText: "OK",
                callback: null
            });
        }, "json")
            .error(function (s, e) {
                alert("Unable to retrieve an access token. Please verify that your application secret is correct.");
            });

    };

    self.deleteClientClicked = function (client) {
        var deleteClient = function (onComplete) {
            var clientData = ko.mapping.toJS(client);
            $.ajax({
                type: "DELETE",
                data: clientData,
                url: EdFiAdmin.Urls.client + "/" + client.Key(),
                success: function (data, textStatus, jqXHR) {
                    self.apiClients.remove(client);
                    onComplete();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    self.error(errorThrown);
                    onComplete();
                    return 0;
                }
            });
        };

        self.error("");
        self.confirmationDialog.show({
            message: "This operation will permanently delete this sandbox, and all uploaded data will be lost.  " +
                "<br/><br/>" +
                "This operation cannot be undone.",
            buttonText: "Delete",
            callback: deleteClient
        });
    };

    self.resetSandboxClicked = function(client) {
        var resetClient = function (onComplete) {
            var clientData = ko.mapping.toJS(client);
            $.ajax({
                type: "PUT",
                data: clientData,
                url: EdFiAdmin.Urls.client + "/reset",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    self.resetDialog.show({
                        message: ("Sandbox reset successfully."),
                        buttonText: "OK",
                        callback: null
                    });
                    onComplete();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    self.error(errorThrown);
                    onComplete();
                    return 0;
                }
            });
        };

        self.error("");
        self.confirmationDialog.show({
            message: "This operation will reset this sandbox, and all uploaded data will be lost.  " +
                "<br/><br/>" +
                "This operation cannot be undone.",
            buttonText: "Reset",
            callback: resetClient
        });
    };

    self.addApplicationClicked = function () {
        self.addApplicationDialog.show({ callback: self.doAddClient });
    };

    // Load the original data
    self.getData();
}

var boundModel;
$(function () {

    $.ajaxSetup({
        contentType: 'application/json',
        processData: false
    });
    $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
        if (options.data) {
            options.data = JSON.stringify(options.data);
        }
    });

    var viewModel = new ClientsViewModel();
    boundModel = viewModel;
    ko.applyBindings(viewModel);
});