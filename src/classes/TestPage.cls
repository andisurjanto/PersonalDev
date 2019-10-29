public with sharing class TestPage
{
	public String concatAccountNames {get; set;}
	public List <Account> accounts {get; set;}
	public Integer showPage {get;set;}
	public Integer pageNo {get;set;}

	public TestPage()
	{	// single line comment
		/*
		Multile line comment
		*/
		accounts = [SELECT Id, Name FROM Account];
		concatAccountNames = '';
		for (Account account : accounts)
		{
			concatAccountNames += account.Name;
		}
	}

	public void updatePage() {
		showPage = pageNo;
	}
}