public class RegionPickList
{
public String region{get; set;}
public String categorylist{get; set;}


public List<SelectOption> getregionnames()
{
  List<SelectOption> options = new List<SelectOption>();
  List<RegionKinCare__c> tempList = new List<RegionKinCare__c>();
  tempList = [Select Id, name FROM RegionKinCare__c ];
  options.add(new SelectOption('--None--','--None--'));
  for (Integer j=0;j<tempList.size();j++)
  {
      options.add(new SelectOption(tempList[j].name,tempList[j].name));
  }
  return options;
}

public List<SelectOption> getcategorynames()
{
  List<SelectOption> options = new List<SelectOption>();
  List<DynamicPicklist__c> categorylist = new List<DynamicPicklist__c>();
  categorylist = [Select Id, PicklistCategory__c FROM DynamicPicklist__c ORDER BY PicklistCategory__c DESC];
  options.add(new SelectOption('--None--','--None--'));
  for (Integer j=0;j<categorylist.size();j++)
  {
      options.add(new SelectOption(categorylist[j].PicklistCategory__c,categorylist[j].PicklistCategory__c));
  }
  return options;
}

public String newpicklistvalue{get; set;}
public String newpicklistcategory{get; set;}

public void saverec()
{
  DynamicPicklist__c newrec = new DynamicPicklist__c(PicklistValue__c=newpicklistvalue);
  insert newrec;
  newpicklistvalue=NULL;
}

}