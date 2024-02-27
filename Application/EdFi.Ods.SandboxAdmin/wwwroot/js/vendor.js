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




var addApplicationDialog = function () {
    var self = this;

    self.vendorName = ko.observable('');
    self.namespacePrefix = ko.observable('');
    self.canAdd = ko.computed(function () {
        return self.vendorName().length > 0;
    });

    self.htmlId = "modal-add";
    var modal = new ModalController({ htmlId: self.htmlId });
    this.onOkClicked = modal.onOkClicked;

    this.show = function (options) {
        self.vendorName('');
        self.namespacePrefix('');
        modal.show(options.callback);
    };
};

var editApplicationDialog = function () {
    var self = this;

    self.vendorName = ko.observable('');
    self.namespacePrefix = ko.observable('');
    self.vendorId = ko.observable('');
    self.vendorObject = ko.observable('');
    self.canEdit = ko.computed(function () {
        return self.vendorName().length > 0;
    });

    self.htmlId = "modal-edit";
    var modal = new ModalController({ htmlId: self.htmlId });
    this.onOkClicked = modal.onOkClicked;

    this.show = function (options, vendor) {
        self.vendorName(vendor.Name());
        self.namespacePrefix(vendor.NamespacePrefix());
        self.vendorId(vendor.Id());
        self.vendorObject(vendor);
        modal.show(options.callback);
    };
};

var VendorViewModel = function (data) {
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

function VendorsViewModel() {
    var self = this;
    var VendorMapping = {
        create: function (options) {
            return new VendorViewModel(options.data);
        }
    };
    self.vendors = ko.mapping.fromJS([], VendorMapping);
    self.error = ko.observable();
    self.confirmationDialog = new confirmationDialog();
    self.addApplicationDialog = new addApplicationDialog();
    self.editApplicationDialog = new editApplicationDialog();

    self.shouldShowTable = ko.computed(function () {
        return self.vendors().length > 0;
    });

    self.canAddMoreVendors = ko.observable(true);

    self.vendorStatus = ko.computed(function () {
        switch (self.vendors().length) {
            case 0:
                return "You have no vendors";
            case 1:
                return "You have 1 vendor";
            default:
                return "You have " + self.vendors().length + " vendors";
        }

    });

    self.getData = function () {
        $.ajax(
            {
                type: "GET",
                url: EdFiAdmin.Urls.vendor,
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    ko.mapping.fromJS(data, self.vendors);
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

    self.doAddVendor = function (onComplete) {
        self.error("");
        var vendorName = self.addApplicationDialog.vendorName();
        var namespacePrefix = self.addApplicationDialog.namespacePrefix();
        $.ajax({
            type: "POST",
            data: { "VendorName": vendorName, "NamespacePrefix": namespacePrefix },
            url: EdFiAdmin.Urls.vendor,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                onComplete();
                var newVendor = new VendorViewModel(data);
                self.vendors.push(newVendor);
                if (newVendor.IsLoading) {
                    with (self) { setTimeout(function () { getData(); }, 3000); }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                onComplete();
                switch (jqXHR.status) {
                    case 400:
                        self.error(jqXHR.responseText);
                        break;
                     default:
                        self.error(textStatus);
                }
                return 0;
            }
        });
    };

    self.doEditVendor = function (onComplete) {

        self.error("");
        var vendorName = self.editApplicationDialog.vendorName();
        var namespacePrefix = self.editApplicationDialog.namespacePrefix();
        var vendorId = self.editApplicationDialog.vendorId();
        var vendor = self.editApplicationDialog.vendorObject();
        
        $.ajax({
            type: "PUT",
            data: { "Name": vendorName, "NamespacePrefix": namespacePrefix, "Id": vendorId },
            url: EdFiAdmin.Urls.vendor + "/" + vendorId,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                var updatedVendor = new VendorViewModel(data);
                self.vendors.replace(vendor, updatedVendor);
                onComplete();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                self.error(jqXHR.responseText);
                onComplete();
                return 0;
            }
        });
    };

    self.deleteVendorClicked = function (Vendor) {
        var deleteVendor = function (onComplete) {
           var VendorData = ko.mapping.toJS(Vendor);
            $.ajax({
                type: "DELETE",
                data: VendorData,
                url: EdFiAdmin.Urls.vendor + "/" + Vendor.Id(),
                success: function (data, textStatus, jqXHR) {
                    self.vendors.remove(Vendor);
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
            message: "This operation will permanently delete this vendor, and all dependency data will be lost.  " +
                "<br/><br/>" +
                "This operation cannot be undone.",
            buttonText: "Delete",
            callback: deleteVendor
        });
    };

    self.addVendorClicked = function () {
        self.addApplicationDialog.show({ callback: self.doAddVendor });
    };
    self.updateVendorClicked = function (vendor) {
        self.editApplicationDialog.show({ callback: self.doEditVendor }, vendor);
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

    var viewModel = new VendorsViewModel();
    boundModel = viewModel;
    ko.applyBindings(viewModel);
});