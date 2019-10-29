public with sharing class ContactSearch {
	public static List<Contact> searchForContacts(String tmpLastName, String tmpMailingPostalCode) {
		List <Contact> tmpsearchForContacts = [Select Id, LastName, MailingPostalCode from Contact
			Where  LastName =: tmpLastName And MailingPostalCode =: tmpMailingPostalCode];

		return tmpsearchForContacts;
	}
}