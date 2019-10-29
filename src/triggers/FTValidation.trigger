trigger FTValidation on FeeTable__c ( before insert, before update) {
	List<FeeTable__c> feeTables = new List<FeeTable__c>();

	for (FeeTable__c ft : trigger.new) {
		String ftName = ft.name;
		String ftLocation = ft.location__c;
		String ftFeeCategory = ft.feeCategory__c;
		String ftPeriodOfService = ft.periodOfService__c;
		String ftSpecificGrade = ft.specificGrade__c;

		//Get list of record type from the object
		Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.FeeTable__c.getRecordTypeInfosById();
		String ftRecordTypeName = rtMap.get(ft.recordtypeid).getName();

		//Get list of records based on the record type
		if (ftRecordTypeName.equals('Parent Fee Table')) {
			feeTables = [SELECT name, location__c FROM FeeTable__c WHERE Name = :ftName AND location__c = :ftLocation];
		} else {
			feeTables = [SELECT name, location__c, feeCategory__c, periodOfService__c, specificGrade__c FROM FeeTable__c WHERE Name = :ftName AND location__c = :ftLocation AND
			feeCategory__c = :ftFeeCategory AND periodOfService__c = :ftPeriodOfService AND specificGrade__c = :ftSpecificGrade];
		}

		if ((Trigger.isBefore == true && Trigger.isInsert == true)) {
			//Before insert
			if (feeTables.size() > 0) {
				ft.name.addError('Fee Table Name already Exist');
			}
		} else if (Trigger.isBefore == true && Trigger.isUpdate == true)
			{	//Before update - compare the current record against the previous one (oldMap function)
				FeeTable__c oldFt = trigger.oldMap.get(ft.ID);
				if (ftRecordTypeName.equals('Parent Fee Table'))
				{	if (ft.Name != oldFt.Name || ft.location__c != oldFt.location__c)
					{	if (feeTables.size() > 0)
						{	ft.name.addError('Fee Table Name already Exist');
						}
					}
				} else if (ft.Name != oldFt.Name || ft.location__c != oldFt.location__c || ft.feeCategory__c != oldFt.feeCategory__c || ft.periodOfService__c != oldFt.periodOfService__c || ft.specificGrade__c != oldFt.specificGrade__c)
						{	if (feeTables.size() > 0)
							{	ft.name.addError('Fee Table Name already Exist');
							}
						}
			}
	}
}