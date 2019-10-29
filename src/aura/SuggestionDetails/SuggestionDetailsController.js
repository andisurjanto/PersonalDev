({
    locationChange: function(component, event, helper) {
        var token = event.getParam("token");
        if (token != null) {
            if (token.indexOf('suggestion/') === 0) {
                var suggestionId = token.substr(token.indexOf('/') + 1);
                var action = component.get("c.findById");
                action.setParams({
                    "suggestionId": suggestionId
                });
                action.setCallback(this, function(a) {
                    component.set("v.suggestion", a.getReturnValue());
                });
                $A.enqueueAction(action);
            }
        }
    },


    doInit: function(component, event) {
        var token = event.getParam("token");
    },

    voteup: function(component, event) {

        var suggestionId = event.target.id;
        var action = component.get("c.voteSuggestion");
        action.setParams({
            "suggestionId": component.get("v.suggestion.Id")
        });
        action.setCallback(this, function(a) {
            component.set("v.suggestion", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})