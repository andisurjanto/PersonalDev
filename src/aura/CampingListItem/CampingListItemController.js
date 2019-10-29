({
	packItem : function(component, event, helper) {
		var abc = component.get("v.newitem",true);
        abc.Packed__c = true;
        component.set("v.newitem",abc);
        
        var btnClicked = event.getSource(); 
        btnClicked.set("v.disabled",true);
    }
})