@isTest
private class myDataGenerationTests {
	@testSetup
    static void loadMockDataFromFile() {
        List<sobject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    @isTest
    static void checkForAccounts() {
        List<Account> accts = [SELECT ID FROM Account];
        System.assertEquals(15, accts.size(), 'Expected 15 Accounts.');
    }
}