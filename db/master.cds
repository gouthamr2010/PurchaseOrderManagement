using {
    cuid,
    Country
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
}
