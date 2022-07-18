public class AccountUtils {
    public static List<Account> accountsByState(String stateAbbreviation) {
        List<Account> foundAccounts = new List<Account>();
        foundAccounts = [SELECT Id, Name FROM Account WHERE( BillingState = :stateAbbreviation)];
        return foundAccounts;
    }
}