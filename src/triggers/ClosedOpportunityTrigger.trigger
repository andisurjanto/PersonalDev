trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();

	for (Opportunity opp : Trigger.new)  {
		if (Trigger.isInsert) {
			if (opp.StageName == 'Closed Won') {
				taskList.add(new Task(Subject='Follow Up Test Task', WhatId = opp.Id));
			}		
		}

		if (trigger.isUpdate) {
			Opportunity oldOpp = Trigger.oldMap.get(opp.ID);
			if (oldOpp.StageName != 'Closed Won' && opp.StageName == 'Closed Won') {
				taskList.add(new Task(Subject='Follow Up Test Task', WhatId = opp.Id));
			}			
		}
	}

	if (taskList.size() > 0) {
		insert taskList;
	}

}