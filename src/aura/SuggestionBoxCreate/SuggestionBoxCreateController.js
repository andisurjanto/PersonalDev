({
   addNew: function(component, event, helper) 
    			{
                var el = component.find('formbox');
                if ($A.util.hasClass(el.getElement(), 'myboxhidden')) 
                {
                helper.showInput(component);
				} 
                    else {
				helper.hideInput(component);
						 }
				},
                
    createSuggestion: function(component, event, helper) 
    			{
                var newSuggestion = component.get("v.newSuggestion");
                helper.createSuggestion(component, newSuggestion);
				}
})