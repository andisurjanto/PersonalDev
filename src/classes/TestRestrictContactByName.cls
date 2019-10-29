@isTest
private class TestRestrictContactByName
{
	@isTest
	static void testInvalidName()
	{
		Contact con = new Contact();
		con.FirstName = 'FirstTest';
		con.LastName = 'INVALIDNAME';

		try {
			insert con;
		} 
		catch(Exception e) {
			Boolean expectedExceptionThrown= false;
			if (e.getMessage().contains('INVALIDNAME')) expectedExceptionThrown =true;
	        System.assertEquals(expectedExceptionThrown, true);	
		}

	}
}