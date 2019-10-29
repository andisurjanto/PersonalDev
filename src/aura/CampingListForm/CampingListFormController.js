({
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
    }
})