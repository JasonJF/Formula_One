@isTest
private class AccountWrapper_Tests {
    @testSetup
    static void loadTestData() {
        List<Account> accounts = (List<Account>) Test.loadData(Account.SObjectType, 'accountData');
        
        
        System.debug('List of acccounts: ' + accounts);
        List<Opportunity> opps = new List<Opportunity>();
        for(Account a: accounts) {
            opps.addAll(TestFactory.generateOppsForAccount(a.Id, 200000.00, 5));
        }
        //Create a high value account
        Account h = new Account(Name='High_Value_Account');
        accounts.add(h);
        insert h;
        opps.addAll(TestFactory.generateOppsForAccount(h.Id, 200000.00, 2));
        
        insert opps;
        System.debug('List of Opportunities: '+ opps);
        
    }
    @isTest
    static void testPositiveRoundedAveragePrice() {
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for(Account a: [SELECT ID, Name FROM Account]){
            accounts.add(new AccountWrapper(a));
        }
        //sanity check asserting that we have opportunities before executing our tested method.
        List<Opportunity> sanityCheckListOfOpps = [SELECT ID FROM Opportunity];
        System.assert(sanityCheckListOfOpps.size() > 0, 'You  need an opportunity to continue');
        Test.startTest();
        for(AccountWrapper a: accounts) {
            System.assertEquals(a.getRoundedAvgPriceOfOpps(), 200000.00, 'Expected to get 200000.00');
        }
        Test.stopTest();
    }
    @isTest
    static void testHighPriorityMethod() {
        Account highValueAccount = [SELECT ID, Name FROM Account WHERE (Name='High_Value_Account')];
        //System.debug(highValueAccount);
        
        AccountWrapper wrappedHighValueAccount = new AccountWrapper(highValueAccount);
        Test.startTest();
        System.assert(wrappedHighValueAccount.isHighPriority(), 'Expected isHighPriority method to return true.');
        Test.stopTest();
    }
    @isTest
    static void testNegativeAccountWrapperRoundedOpps(){
        List<Account> accts = [SELECT Id FROM Account];
        List<Opportunity> opps = [SELECT ID, Amount FROM Opportunity WHERE accountId in: accts];
        List<AccountWrapper> wrappers = new List<AccountWrapper>();
        for(Opportunity o: opps){
            o.amount = 0;
        }
        update opps;
        for(Account a : accts){
            wrappers.add(new AccountWrapper(a));
        }
        Test.startTest();
        List<Boolean> exceptions = new List<Boolean>();
        for(AccountWrapper a : wrappers){
            try{
                a.getRoundedAvgPriceOfOpps();
            } catch (AccountWrapper.AWException awe){
                if(awe.getMessage().equalsIgnoreCase('no won opportunities')){
                    exceptions.add(true);
                }
            }
        }
        Test.stopTest();
        System.assertNotEquals(null, exceptions, 'expected at least one exception to have occured');
        for(Boolean b : exceptions){
         System.assert(b, 'Account should have thrown an exception');
        }
    }
}