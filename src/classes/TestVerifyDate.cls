@isTest
private class TestVerifyDate
{
	@isTest
	static void testWithIn30Days()
	{
		Date date1 = Date.newInstance(2018, 06, 08);
		Date date2 = Date.newInstance(2018, 06, 18);
		System.assertEquals(date2, VerifyDate.CheckDates(date1,date2));

	}

	@isTest
	static void testMoreThan30Days()
	{
		Date date1 = Date.newInstance(2018, 06, 08);
		Date date2 = Date.newInstance(2018, 08, 18);
		System.assertEquals(Date.newInstance(2018, 06, 30), VerifyDate.CheckDates(date1,date2));
	}

}