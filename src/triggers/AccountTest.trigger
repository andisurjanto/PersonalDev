trigger AccountTest on Account (before insert, after update)
{
	if (Trigger.isBefore == true && Trigger.isInsert == true)
	{
//		List <Account> accountsToBeUpdated = new List <Account>();
		
		for (Account account : Trigger.new)
		{
			
			if (account.BillingState == 'NSW')
			{
//				Account account2 = new Account(Id = account.Id);
				account.Phone = '12345';
//				accountsToBeUpdated.add(account2);
				System.debug('----->' + account.Id);
			}
		}
		
//		update accountsToBeUpdated;
	}
	else if (Trigger.isAfter && Trigger.isUpdate)
	{
		
	}
}