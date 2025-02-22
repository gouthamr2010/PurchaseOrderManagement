using {
    cuid,
    managed,
    Country,
    Currency
} from '@sap/cds/common';
using {com.gr.common as common} from './common';
using from '@sap/cds-common-content';

namespace com.gr;

context master {
    entity Employees : cuid {
        firstName   : String;
        lastName    : String;
        name        : String = firstName || ' ' || lastName;
        email       : common.Email;
        phoneNumber : common.PhoneNumber;

        @cascade: all
        address     : Association to Addresses;
    }

    @cds.autoexpose
    entity Addresses : cuid {
        building   : String(10);
        street     : String(60);
        city       : String(40);
        postalCode : String(10);
        country    : Country;
        region     : String(4);
    }

    entity BusinessPartners : cuid, managed {
        partnerRole                  : PartnerRole default 1;
        email                        : common.Email;
        phoneNumber                  : common.PhoneNumber;
        webAddress                   : String;

        @cascade: all
        address                      : Association to Addresses;
        companyName                  : String(80);
        legalForm                    : String(10);
        currency                     : Currency;
        @readonly createdByEmployee  : Association to Employees
                                           on createdByEmployee.email = createdBy;
        @readonly modifiedByEmployee : Association to one Employees
                                           on modifiedByEmployee.email = modifiedBy;
    }

    type PartnerRole : Integer enum {
        Customer = 1;
        Supplier = 2;
    }

    entity Products : managed, common.Quantity {
        key productId     : String(10);
            typeCode      : String(2);
            category      : String(40);
            name          : localized String;
            desc          : localized String;
            partner       : Association to master.BusinessPartners;
            weightMeasure : Decimal(13, 3);
            weightUnit    : String(3);
            currency      : Currency;
            price         : Decimal(15, 2);
            picUrl        : String(255);
            width         : Decimal(13, 3);
            depth         : Decimal(13, 3);
            height        : Decimal(13, 3);
            dimensionUnit : String(3);
    }
}
