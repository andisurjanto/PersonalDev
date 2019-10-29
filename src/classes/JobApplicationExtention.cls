public class JobApplicationExtention {

	private final sObject mysObject;
/*	private ApexPages.StandardController controller;
	private Job_Application__c jobApplication;
	private List<String> deliveryAreaList;
	private String deliveryArea;
	private String[] deliveryAreaSplit; */
	public String area{get;set;}
	public String state{get; set;}
	public String subCategory{get;set;}

	// The extension constructor initializes the private member
	// variable mysObject by using the getRecord method from the standard
	// controller.
	public JobApplicationExtention(ApexPages.StandardController stdController) {
		this.mysObject = (sObject)stdController.getRecord();
//		controller = stdController;
//		this.jobApplication = (Job_Application__c)stdController.getRecord();
		this.state = (String)mysObject.get('State__c');
		this.subCategory = (String)mysObject.get('RegionType__c');
		this.area = (String)mysObject.get('DeliveryArea__c');
/*		this.deliveryArea = jobApplication.DeliveryArea__c;
		If (String.isNotBlank(deliveryArea)) {
			deliveryAreaSplit = deliveryArea.split(';');
			deliveryAreaList = new List<String> (deliveryAreaSplit);
		} */
	}

	public String getRecordName() {
		return 'Hello ' + (String)mysObject.get('name') + ' (' + (Id)mysObject.get('Id') + ')';
	}

	public List<SelectOption> getAreaList() {
		List<SelectOption> options = new List<SelectOption>();

		if  (String.isBlank(subCategory)) {
			options.add(new SelectOption('null','-- Select One --'));
		}
		else {
			if (subCategory.equals('LGA')) {
				List<AggregateResult> areaList = [Select LGARegion__c
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY LGARegion__c];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('LGARegion__c');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else if (subCategory.equals('Region')) {
				List<AggregateResult> areaList = [Select Name
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY Name];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('Name');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else if (subCategory.equals('HACC')) {
				List<AggregateResult> areaList = [Select HACCRegion__c
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY HACCRegion__c];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('HACCRegion__c');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else if (subCategory.equals('Suburb')) {
				List<AggregateResult> areaList = [Select Suburb__c
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY Suburb__c];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('Suburb__c');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else if (subCategory.equals('ACAR')) {
				List<AggregateResult> areaList = [Select ACARRegion__c
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY ACARRegion__c];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('ACARRegion__c');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else if (subCategory.equals('FACS')) {
				List<AggregateResult> areaList = [Select FACSDistrict__c
				FROM RegionKincare__c WHERE State__c = :state
				GROUP BY FACSDistrict__c];
				for (AggregateResult ct : areaList) {
					string tmp = (String) ct.get('FACSDistrict__c');
					options.add(new SelectOption(tmp,tmp));
				}
			}
			else {
				options.add(new SelectOption('null','-- Select One --'));

			}
		}
		return options;
	}

	public List<SelectOption> getStateList()
	{
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('null','--Select One--'));
		options.add(new SelectOption('NSW','NSW'));
		options.add(new SelectOption('ACT','ACT'));
		options.add(new SelectOption('VIC','VIC'));
		options.add(new SelectOption('SA','SA'));
		options.add(new SelectOption('WA','WA'));
		options.add(new SelectOption('TAS','TAS'));
		options.add(new SelectOption('QLD','QLD'));
		options.add(new SelectOption('NT','NT'));
/*			List<AggregateResult> stateList =
					[Select State__c stateName
			FROM RegionKincare__c
			Group BY State__c];
			options.add(new SelectOption('null','-- Select One --'));
			for (AggregateResult categr : stateList) {
					string tmp = (String) categr.get('stateName');
					options.add(new SelectOption(tmp,tmp));
			} */
		return options;
	}

	public List<SelectOption> getSubCategoryList()
	{
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('null','--Select One--'));
		options.add(new SelectOption('Region','Region'));
		options.add(new SelectOption('Suburb','Suburb'));
		options.add(new SelectOption('HACC','HACC'));
		options.add(new SelectOption('ACAR','ACAR'));
		options.add(new SelectOption('LGA','LGA'));
		options.add(new SelectOption('FACS','FACS'));
		return options;
	}

	public void updateRegion() {
/*		jobApplication.State__c = state;
		jobApplication.RegionType__c = subCategory;
		jobApplication.DeliveryArea__c = area; */
		//updateRegionByObject(mysObject);
		mysObject.put('State__c', state);
		mysObject.put('RegionType__c', subCategory);
		mysObject.put('DeliveryArea__c', area);
	}

	public void updateRegionByObject (sObject objectName) {
		objectName.put('State__c', state);
		objectName.put('RegionType__c', subCategory);
		objectName.put('DeliveryArea__c', area);
	}

}