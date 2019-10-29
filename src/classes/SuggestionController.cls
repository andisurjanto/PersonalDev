public class SuggestionController {
 	@AuraEnabled
	public static List<Suggestion__c> getSuggestions() {
		return [SELECT id, Name, Status__c, Suggestion_Category__c, Suggestion_Description__c,	Implemented_Date__c, createdDate 
			FROM Suggestion__c 
			ORDER BY createdDate DESC];
	  }
    
    @AuraEnabled
    public static Suggestion__c saveSuggestion(Suggestion__c suggestion) {
        upsert suggestion;
        return suggestion;
    }
    
    @AuraEnabled
    public static List<Suggestion__c> findAll() {
        return [SELECT id, name, Suggestion_Description__c, Vote_up__c FROM Suggestion__c LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Suggestion__c> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, Suggestion_Description__c, Vote_up__c FROM Suggestion__c WHERE name LIKE :name LIMIT 50];
    }  
   
    @AuraEnabled
    public static Suggestion__c findById(String suggestionId) {
        return [SELECT id, name, Status__c, Suggestion_Category__c, Suggestion_Description__c,Vote_up__c
                    FROM Suggestion__c WHERE Id = :suggestionId];
    }
    
    @AuraEnabled
    public static Suggestion__c voteSuggestion(String suggestionId) {
        Suggestion__c s = new Suggestion__c();
        s=[SELECT id, name, Status__c, Suggestion_Category__c, Suggestion_Description__c,Vote_up__c
                    FROM Suggestion__c WHERE Id =:suggestionId];
        
        s.Vote_up__c = s.Vote_up__c + 1;
        upsert s;
        return s;
    } 
}