({	// Load expenses from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getExpenses");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },

	/*
    clickCreate: function(component, event, helper) {
        var validExpense = component.find('expenseform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newExpense = component.get("v.newExpense");
            console.log("Create expense: " + JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);

			//Reset form
			component.set("v.newExpense",{'sobjectType': 'Expense__c',
                        'Name': '',
                        'Amount__c': 0,
                        'Client__c': '',
                        'Date__c': '',
                        'Reimbursed__c': false});
        }
    },*/

    handleUpdateExpense: function(component, event, helper) {
        var updatedExp = event.getParam("expense");
        helper.updateExpense(component, updatedExp);
    },

	handleCreateExpense: function(component, event, helper) {
		var newExpense = event.getParam("expense");
		helper.createExpense(component, newExpense);
    }

})