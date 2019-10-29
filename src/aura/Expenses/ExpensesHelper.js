({
    saveExpense: function(component, expense, callback) {
        var action = component.get("c.saveExpense");
        action.setParams({
			"expense": expense
		});
		if (callback) {
			action.setCallback(this, callback);
		}
        $A.enqueueAction(action);
    },

    createExpense: function(component, expense) {
        this.saveExpense(component, expense, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
        });
    },
    updateExpense: function(component, expense) {
        this.saveExpense(component, expense);
    },



//    createExpense: function(component, expense) {
//        var theExpenses = component.get("v.expenses");
 
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
 //       var newExpense = JSON.parse(JSON.stringify(expense));

 //		console.log("Expenses after 'create': " + JSON.stringify(theExpenses));
 //       theExpenses.push(newExpense);
 //       component.set("v.expenses", theExpenses);
//		console.log("Expenses after 'create': " + JSON.stringify(theExpenses));
 //   }
})