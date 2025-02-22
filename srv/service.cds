using {com.gr.master as master} from '../db/master';

service POManagement @(path: '/browse') {
    entity Employees as projection on master.Employees;
    entity BusinessPartners as projection on master.BusinessPartners
}
