public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        List<Account> modifiedAccounts = new List<Account>();
        for (Account a : accts) {
            a.ShippingState = a.BillingState;
            modifiedAccounts.add(a);
        }
        //if (modifiedAccounts.size() > 0) {
           // insert modifiedAccounts;
        //}
    }
}