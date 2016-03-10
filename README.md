Autocomplete-Visualforce-Component-V2
=====================================
<a href="https://githubsfdeploy.herokuapp.com?owner=avinava&repo=Autocomplete-Visualforce-Component-V2">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

All New V2 version of Visualforce Autocomplete Component


Summing up few features of the V2
-

* The component now uses Select2 instead of Jquery Autocomplete
* Much more faster than earlier version and can handle large dataset
Complete new UI
* The component no more depends on the Jquery from the package and can use jquery from Visualforce page(if already referred in page).
* Configurable : The search field can be configured to search fields other than "Name" field. Even the value that is returned to controller can be configured return fields other than record Id.

How to Use ?
-
```
<c:AutoCompleteV2 allowClear="true" importJquery="true" labelField="Name" SObject="Account" valueField="Id" targetField="{!targetField}" whereClause=" Name AnnualRevenue > 100" style="width:200px"/>  
```
Description
-
* labelField : The field which is displayed in the component  and against which matching is done with the entered text. In above code snippet Name is displayed in the autocomplete component.
* valueField : The field value which is passed back to targetfield when a record is selected.
* targetField : The field from controller where the selected values is set.
* SObject : The sobject Api Name against which matching/query is done.
* importJquery : Assign false if you dont want to jquery files from package.
* syncManualEntry : Allow manual entry of data from autocomplete component. So if a matching value is not found for the entered query string, on page submit the same value will be sibmitted to targefield
* allowClear : Set true to give user a option to clear existing value. If this value is set true user will see a small cross Icon to clear the existing value from the field
* whereClause : Lets you add a WhereClause to the record/lookup search
* onChange : JS method to be invoked when the value changes

> In addition to this a Visualforce Page "AutocompleteV2Demo" is included in package. This page searches through different accounts that are available in the Org. Have a look at the same for syntax and implementation

Demo / Installation
-

http://blogforce9dev-developer-edition.ap1.force.com/ProjectDetail?id=a0290000009KusM
