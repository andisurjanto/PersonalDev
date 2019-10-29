({
	myAction : function(component, event, helper) {
        component.set("v.Columns", [
            {label:"First Name", fieldName:"FirstName", type:"text"},
            {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Phone", fieldName:"Phone", type:"phone"}
        ]);        
        var action = component.get("c.getContacts");
        action.setParams({
            recordId: component.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            component.set("v.Contacts", data.getReturnValue());
        });

		/*
		optionally set storable, abortable, background flag here
		A client-side action could cause multiple events,
		which could trigger other events and
		other server-side action calls.
        $A.enqueueAction adds the server-side action to the queue.*/
        $A.enqueueAction(action);	
	}
})