using {com.gr.master as master} from '../db/master';

annotate master.Employees with {
    firstName @title: '{i18n>FirstName}';
    lastName  @title: '{i18n>LastName}';
    name      @title: '{i18n>FullName}';
};

annotate master.Addresses with {
    building   @title: '{i18n>Building}';
    street     @title: '{i18n>Street}';
    city       @title: '{i18n>City}';
    postalCode @title: '{i18n>PostalCode}';
    region     @title: '{i18n>Region}';
};
