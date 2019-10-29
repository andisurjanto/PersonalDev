public class ObjectList {
	public String val {get;set;}
	public String urlLink {get;set;}
	public String selectedObject {get;set;}
	public String baseURL;
	public list<objectClass> customObjList{get;set;}
	public list<objectClass> standardObjList;
	public list<objectClass> objList{get;set;}

	public ObjectList() {
		baseURL = URL.getSalesforceBaseUrl().toExternalForm();
		this.urlLink = baseURL;
		this.selectedObject = 'Custom Object';
		retrieveObject();
	}

	public List<SelectOption> getName()
	{
		List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
		List<SelectOption> options = new List<SelectOption>();
		for(Schema.SObjectType f : gd)
		{
			if (f.getDescribe().isCustom() ) {
				options.add(new SelectOption(f.getDescribe().getLabel() +'-' +f.getDescribe().getKeyPrefix() ,f.getDescribe().getLabel() + '-' +f.getDescribe().getKeyPrefix() ));
			}
		}
		return sortSelectOptions(options);
	}

	public List<SelectOption> getObjectOption()
	{
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('Custom Object', 'Custom Object'));
		options.add(new SelectOption('Standard Object', 'Standard Object'));
		return options;
	}


	public void updateUrl()
	{
		this.urlLink = baseURL + '/' + val.substringAfter('-');
	}

	//This is a wrapper class.
	public class ObjectClass {
		public string label{get;set;}
		public string urlLink{get;set;}
		public string keyPrefix{get;set;}

		public ObjectClass(String lab, String baseUrl, String prefix) {
			this.label = lab;
			this.urlLink = baseUrl + '/' + prefix;
			this.keyPrefix = prefix;
		}

	}

	public void retrieveObject() {
		objList  = new list<ObjectClass> ();
		customObjList  = new list<ObjectClass> ();
		standardObjList  = new list<ObjectClass> ();
		List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
		for(Schema.SObjectType f : gd)
		{
			if (f.getDescribe().isCustom() ) {
				customObjList.add(new ObjectClass(f.getDescribe().getLabel(), baseUrl ,f.getDescribe().getKeyPrefix()));
			} else  if (String.isNotBlank(f.getDescribe().getKeyPrefix())) {
				standardObjList.add(new ObjectClass(f.getDescribe().getLabel(), baseUrl ,f.getDescribe().getKeyPrefix()));
				}
		}
		if (selectedObject.equals('Custom Object')) {
			objList = sortSelectObjects(customObjList);
		} else {
			objList = sortSelectObjects(standardObjList);
		}
	}

	public List<SelectOption> sortSelectOptions(List<SelectOption> sortingList) {
		for (Integer i =0; i < sortingList.size(); i++) {
			for (Integer j = i; j > 0; j--) {
				if (sortingList[j-1].getLabel() > sortingList[j].getLabel()){
					SelectOption temp = sortingList[j];
					sortingList[j] = sortingList[j-1];
					sortingList[j-1] = temp;
				}
			}
		}
		return sortingList;
	}

	public List<ObjectClass> sortSelectObjects(List<ObjectClass> sortingList) {
		for (Integer i =0; i < sortingList.size(); i++) {
			for (Integer j = i; j > 0; j--) {
				if (sortingList[j-1].label > sortingList[j].label){
					ObjectClass temp = sortingList[j];
					sortingList[j] = sortingList[j-1];
					sortingList[j-1] = temp;
				}
			}
		}
		return sortingList;
	}

		}