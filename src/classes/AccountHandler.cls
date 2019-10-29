public class AccountHandler {
	public static Account insertNewAccount(String accName) {
		DMLException exc;
		Account tmpAcc = new Account(Name=accName);
		try {
				insert tmpAcc;
			} catch (DMLException e) {
				tmpAcc.addError('There was a problem inserting new account');
				System.debug('A DML exception has occurred: ' + e.getMessage());
				return null;
			}
		return tmpAcc;

	}
}