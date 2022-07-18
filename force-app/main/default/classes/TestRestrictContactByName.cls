@isTest
public class TestRestrictContactByName {
    @isTest static void TestInsertInvalidName() {
        //Test data setup
        //Create Contact with invalid name and try to insert it
        Contact testContact = new Contact(LastName='INVALIDNAME');
        
        //Perform Test
        Test.startTest();
        try {
            insert testContact;
        } catch (Exception e) {
            Boolean expectedExceptionThrown =  e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML')? true : false;
			System.AssertEquals(expectedExceptionThrown, true);
        }
        Test.stopTest();
       
    }
}