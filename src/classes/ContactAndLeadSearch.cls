public with sharing class ContactAndLeadSearch {
	
	public static List<List<SObject>> searchContactsAndLeads(String inputString) {
		List<List<sObject>> searchList = [FIND :inputString IN  Name FIELDs 
			RETURNING Lead(Name),Contact(FirstName,LastName,Department)];

		return searchList;
	}
}