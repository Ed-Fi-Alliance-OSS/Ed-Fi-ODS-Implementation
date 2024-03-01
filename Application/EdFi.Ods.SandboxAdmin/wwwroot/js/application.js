/// <reference path="globals.js" />
/// <reference path="edfiadmin.auth.js" />
// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

/*global EdFiAdmin*/

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

var confirmationDialog = function () {
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

var editApplicationDialog = function () {
    var self = this;

    self.applicationName = ko.observable('');
    self.educationOrganizationId = ko.observable('');
    self.vendorList = ko.observableArray();
    self.selectedVendor = ko.observable();
    self.applicationId = ko.observable('');
    self.applicationObject = ko.observable('');

    self.canAdd = ko.computed(function () {
        return self.applicationName().length > 0;
    });

    self.htmlId = "modal-edit";
    var modal = new ModalController({ htmlId: self.htmlId });
    this.onOkClicked = modal.onOkClicked;

    function VendorTemplate(data) {
        var self = this;
        self.Id = ko.observable(data.Id);
        self.Name = ko.observable(data.Name);
    }

    this.show = function (options) {

        self.applicationObject(options.application);
        self.applicationName(options.application.ApplicationName());
        self.educationOrganizationId(options.application.EducationOrganizationId());
        self.applicationId(options.application.Id());

        $.each(options.vendors, function (Id, data) {
            self.vendorList.push(new VendorTemplate(data));
        });

        var selectedVendor = self.vendorList().find(function (vendor) {
            return vendor.Name() === options.application.VendorName();
        });

        self.selectedVendor(selectedVendor || null);
        modal.show(options.callback);
    };
};
var addApplicationDialog = function () {
    var self = this;

    self.applicationName = ko.observable().extend({
        required: true,
        pattern: {
            message: 'Please enter only letters',
            params: /^[A-Za-z]+$/
        }
    });

    self.educationOrganizationId = ko.observable().extend({
        required: true,
        pattern: {
            message: 'Please enter a valid number with at least six digits of educationOrganizationId',
            params: /^\d{6,}$/
        }
    });
    self.vendorList = ko.observableArray();
    self.selectedVendor = ko.observable();


    self.htmlId = "modal-add";
    var modal = new ModalController({ htmlId: self.htmlId });

    var firstStepValidation = [
        self.applicationName,
        self.educationOrganizationId,
        self.selectedVendor
    ];

    this.onOkClicked = modal.onOkClicked;

    function VendorTemplate(data) {
        var self = this;
        self.Id = ko.observable(data.Id);
        self.Name = ko.observable(data.Name);
    }

    this.show = function (options) {
        self.applicationName('');
        self.educationOrganizationId('');
        self.vendorList = ko.observableArray();

        $.each(options.vendors, function (Id, data) {
            if (data.Name !== "") {
                self.vendorList.push(new VendorTemplate(data));
            }
        });

        var selectVendorData = {
            Id: -1,
            Name: "Select Vendor"
        };
        self.vendorList.push(new VendorTemplate(selectVendorData));

        self.selectedVendor(self.vendorList().find(function (vendor) {
            return vendor.Name === 'Select Vendor';
        }));

        modal.show(options.callback);
    };

    self.canAdd = ko.computed(function () {
        var errors = ko.validation.group(firstStepValidation);
        return errors().length === 0;
    });
};

var ApplicationViewModel = function (data) {
    var self = this;
    ko.mapping.fromJS(data, {}, this);
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

function ApplicationsViewModel() {
    var self = this;
    var ApplicationMapping = {
        create: function (options) {
            return new ApplicationViewModel(options.data);
        }
    };
    self.applications = ko.mapping.fromJS([], ApplicationMapping);
    self.error = ko.observable();
    self.confirmationDialog = new confirmationDialog();
    self.addApplicationDialog = new addApplicationDialog();
    self.editApplicationDialog = new editApplicationDialog();

    self.shouldShowTable = ko.computed(function () {
        return self.applications().length > 0;
    });

    self.canAddMoreApplications = ko.observable(true);

    self.applicationStatus = ko.computed(function () {
        switch (self.applications().length) {
            case 0:
                return "You have no applications";
            case 1:
                return "You have 1 application";
            default:
                return "You have " + self.applications().length + " applications";
        }

    });

    self.getData = function () {
        $.ajax(
            {
                type: "GET",
                url: EdFiAdmin.Urls.application,
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    ko.mapping.fromJS(data, self.applications);
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

    self.getVendors = function (callback) {
        $.ajax(
            {
                type: "GET",
                url: EdFiAdmin.Urls.vendor,
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    var vendors = data
                        .filter(function (item) {
                            return item.Name.trim() !== ""; 
                        })
                        .map(function (item) {
                            return { Id: item.Id, Name: item.Name };
                        });

                    if (typeof callback === 'function') {
                        callback(vendors); 
                    }

                    if (!IsFullyLoaded(data)) {
                        with (self) { setTimeout(function () { getVendors(); }, 3000); }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    self.error(errorThrown);
                    return 0;
                }
            });
    };

    self.doAddApplication = function (onComplete) {
        self.error("");
        var applicationName = self.addApplicationDialog.applicationName();
        var educationOrganizationId = parseInt(self.addApplicationDialog.educationOrganizationId());
        var vendorId = self.addApplicationDialog.selectedVendor().Id;
        $.ajax({
            type: "POST",
            data: { "ApplicationName": applicationName, "EducationOrganizationId": educationOrganizationId, "VendorId": vendorId },
            url: EdFiAdmin.Urls.application,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                onComplete();
                var newApplication = new ApplicationViewModel(data);
                self.applications.push(newApplication);
                if (newApplication.IsLoading) {
                    with (self) { setTimeout(function () { getData(); }, 3000); }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                onComplete();
                switch (jqXHR.status) {
                    default:
                        self.error(textStatus);
                }
                return 0;
            }
        });
    };

    self.doEditApplication = function (onComplete) {
        self.error("");
        var applicationName = self.editApplicationDialog.applicationName();
        var educationOrganizationId = parseInt(self.editApplicationDialog.educationOrganizationId());
        var vendorId = self.editApplicationDialog.selectedVendor().Id();
        var vendorName = self.editApplicationDialog.selectedVendor().Name();
        var applicationId = self.editApplicationDialog.applicationId();
        var application = self.editApplicationDialog.applicationObject();

        $.ajax({
            type: "PUT",
            data: { "ApplicationName": applicationName, "EducationOrganizationId": educationOrganizationId, "VendorId": vendorId, "Id": applicationId, "VendorName": vendorName },
            url: EdFiAdmin.Urls.application + "/" + applicationId,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                
                var updatedApplication = new ApplicationViewModel(data);
                self.applications.replace(application, updatedApplication);
                onComplete();
                if (updatedApplication.IsLoading) {
                    with (self) { setTimeout(function () { getData(); }, 3000); }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                onComplete();
                switch (jqXHR.status) {
                    default:
                        self.error(textStatus);
                }
                return 0;
            }
        });
    };

    self.deleteApplicationClicked = function (application) {
        var deleteApplication = function (onComplete) {
            var applicationData = ko.mapping.toJS(application);
            $.ajax({
                type: "DELETE",
                data: applicationData,
                url: EdFiAdmin.Urls.application + "/" + applicationData.Id,
                success: function (data, textStatus, jqXHR) {
                    self.applications.remove(application);
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
            message: "Proceeding with this operation will permanently delete the selected application, along with all associated data." +
                "<br/><br/>" +
                "This operation cannot be undone.",
            buttonText: "Delete",
            callback: deleteApplication
        });
    };


   self.addApplicationClicked = function () {
       self.getVendors(function (vendors) {
            self.addApplicationDialog.vendorList(vendors);
            self.addApplicationDialog.show({ callback: self.doAddApplication ,vendors });
        });
    };

    self.updateApplicationClicked = function (application) {
        self.getVendors(function (vendors) {
            self.editApplicationDialog.vendorList(vendors);
            self.editApplicationDialog.show({ callback: self.doEditApplication, application, vendors });
        });
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

    ko.validation.init({

        registerExtenders: true,
        messagesOnModified: true,
        insertMessages: true,
        parseInputAttributes: true,
        errorClass: 'errorStyle',
        messageTemplate: null

    }, true);

    var viewModel = new ApplicationsViewModel();
    boundModel = viewModel;
    ko.applyBindings(viewModel);
});