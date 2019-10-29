public class JobApplicationRegionExtention {

    // Declare standardController controller
    private ApexPages.StandardController controller;
    private Job_Application__c jobApplication;
public String city{get; set;}
public String state{get; set;}
public String subCategory{get;set;}
public List<String> selectedCity{get;set;}

    // The extension constructor initializes the private member
public JobApplicationRegionExtention(ApexPages.StandardController stdController) {
        controller = stdController;
        this.jobApplication = (Job_Application__c)stdController.getRecord();
//        bUpdate = pos.id == null ? false : true;
    }
    
    public void updateRegion() {
                jobApplication.Region__c = city;
    }

public List<SelectOption> getcitynames()
{ List<SelectOption> options = new List<SelectOption>();
 
        if  (String.isBlank(subCategory)) {
                options.add(new SelectOption('null','-- Select One --'));
        }
        else {
                if (subCategory.equals('HACC')) {
                        List<DynamicPicklist__c> citylist = [Select Id, HACCRegion__c 
                FROM DynamicPicklist__c WHERE PicklistCategory__c = :state];
                for (DynamicPicklist__c ct : citylist) {
                                options.add(new SelectOption(ct.HACCRegion__c,ct.HACCRegion__c));
                }
        }
    else {
                List<DynamicPicklist__c> citylist = [Select Id, PicklistValue__c 
                FROM DynamicPicklist__c WHERE PicklistCategory__c = :state];
                for (DynamicPicklist__c ct : citylist) {
                        options.add(new SelectOption(ct.PicklistValue__c,ct.PicklistValue__c));
                }
                }
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

public List<SelectOption> getsubcategories()
{
  List<SelectOption> options = new List<SelectOption>();
  List<AggregateResult> subCategorylist = 
        [Select PicklistSubCategory__c subCategory
        FROM DynamicPicklist__c 
        Group BY PicklistSubCategory__c];
        
  options.add(new SelectOption('null','-- Select One --'));
  for (AggregateResult categr : subCategorylist)
  {
        string tmp = (String) categr.get('subCategory');
    options.add(new SelectOption(tmp,tmp));
  }
  return options;
}




}