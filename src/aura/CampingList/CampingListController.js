({	// Load items from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },

	clickCreateItem: function(component, event, helper) {
        var validExpense = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new item
            var newItem = component.get("v.newItem");
            console.log("Create new item: " + JSON.stringify(newItem));
            helper.createItem(component, newItem);
            
            //resets form
            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});

        }
    },

    handleAddItem: function(component, event, helper) {
        var newItem = event.getParam("item");
//        helper.createItem(component, newItem);
        var action = component.get("c.saveItem");
        action.setParams({
			"item": newItem
		});

        action.setCallback(this, function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);

    }

})