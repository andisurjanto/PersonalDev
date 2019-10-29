({
    showInput: function(component) {
        var el = component.find('formbox');
        $A.util.removeClass(el.getElement(), 'myboxhidden');
        $A.util.addClass(el.getElement(), 'mybox');
    },

    hideInput: function(component) {
        var el = component.find('formbox');
        $A.util.addClass(el.getElement(), 'myboxhidden');
    },

    createSuggestion: function(component, suggestion) {
        this.upsertSuggestion(component, suggestion, function(a) {
            var suggestions = component.get("v.suggestions");
            suggestions.unshift(a.getReturnValue());
            component.set("v.suggestions", suggestions);
            this.hideInput(component);
        });
    },
    upsertSuggestion: function(component, suggestion, callback) {
        var action = component.get("c.saveSuggestion");
        action.setParams({
            "suggestion": suggestion
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }

})