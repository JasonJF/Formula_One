@isTest
public class TestVerifyDate {
	@isTest static void checkDataWithin30Days() {
        //Create dates to check
        Date date1 = date.parse('01/01/2021');
        Date date2 = date.parse('15/01/2021');
        
        Date check = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2,check);
    }
    @isTest static void checkSetEndOfMonthDate() {
        //Create dates to check
        Date date1 = date.parse('01/01/2021');
        Date date2 = date.parse('15/02/2021');
        
        Date check = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date.parse('31/01/2021'),check);
    }
}