public class DynamicPickList
{
public String city{get; set;}
//public String categorylist{get; set;}
public String state{get; set;}
public List<String> selectedCity{get;set;}


public List<SelectOption> getcitynames()
{
  List<SelectOption> options = new List<SelectOption>();
  List<DynamicPicklist__c> citylist = 
                [Select Id, PicklistValue__c 
                FROM DynamicPicklist__c WHERE PicklistCategory__c = :state];
                
  options.add(new SelectOption('null','-- Select One --'));
  for (DynamicPicklist__c ct : citylist)
  {
      options.add(new SelectOption(ct.PicklistValue__c,ct.PicklistValue__c));
  }
  
  return options;
}

public List<SelectOption> getstatenames()
{
  List<SelectOption> options = new List<SelectOption>();
  List<AggregateResult> statelist = 
        [Select PicklistCategory__c stateName
        FROM DynamicPicklist__c 
        Group BY PicklistCategory__c];
        
  options.add(new SelectOption('null','-- Select One --'));
  for (AggregateResult categr : statelist)
  {
        string tmp = (String) categr.get('stateName');
    options.add(new SelectOption(tmp,tmp));
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