@isTest
private class AccountTriggerTest {
    @isTest static void TestBillingEqualsShippingState() {
        List<Account> newAccounts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account a = new Account(Name='Test Account ' + i, BillingState='CA');
            newAccounts.add(a);
        }
        //Perform Tests
        Test.startTest();
        insert newAccounts;
        Test.stopTest();
        //Verify Accounts
        List<Account> verifyAccts = new List<Account>();
        verifyAccts = [SELECT Id,ShippingState FROM Account];
        for (Account a : verifyAccts) {
            System.assertEquals('CA', a.ShippingState);
        }
        
    }
}