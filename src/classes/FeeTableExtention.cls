public class FeeTableExtention {
	private final sObject mysObject;
	public String selectedOpt {get;set;}
	private String feeTableId;

	public FeeTableExtention(ApexPages.StandardController stdController)
	{
		this.mysObject = (sObject)stdController.getRecord();

	}

	public List<FeeTable__c> getChildList()
	{	List<FeeTable__c> feeTables = new List<FeeTable__c>();
		If (String.isNotBlank(selectedOpt)) {
			String tmp = '\''+ selectedOpt + '\'';
//			String queryString = 'Select Name, specificgrade__c, ParentFeeTable__c, (Select Name, specificgrade__c, ParentFeeTable__c from FeeTables__r) from FeeTable__c WHERE ParentFeeTable__c = ' + tmp;
			String queryString = 'Select Name, specificgrade__c, ParentFeeTable__c from FeeTable__c WHERE ParentFeeTable__c = ' + tmp;
			feeTables = database.query(queryString);

		}
	return feeTables;
	}


	public List<SelectOption> getFeeTableGroup()
	{	List<FeeTable__c> fts = [SELECT Name FROM FeeTable__c WHERE recordtype.name = 'Parent Fee Table'];
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('','-- Select One --'));
		for (FeeTable__c ft : fts) {
			options.add(new SelectOption(ft.id, ft.Name));
		}
		return options;
	}

}