public with sharing class RandomContactFactory {
	public RandomContactFactory() {
		
	}

	public static List<Contact> generateRandomContacts(Integer noOfContact, String lastName) {
		List<Contact> contactList = new List<Contact>();

		for(Integer i=0;i<noOfContact;i++) {
			Contact con = new Contact();
			con.FirstName = 'Test' + ' ' + i+1;
			con.LastName = lastName;
			contactList.add(con);
		}
		return contactList;
	}

}