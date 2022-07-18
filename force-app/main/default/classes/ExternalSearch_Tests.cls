@isTest
private class ExternalSearch_Tests {
	@isTest
    static void test_method_one() {
        HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        	result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        System.assertEquals('I found it!', result);
    }
    @isTest
    static void test_failed_response() {
        HttpMockFactory mock = new HttpMockFactory(500, 'Internal server error', 'Something went wrong.', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Boolean caughtError = false;
        Test.startTest();
        try {
            result = ExternalSearch.googleIt('dummy search');
        } catch(ExternalSearch.ExternalSearchException e) {
            if(e.getMessage().EqualsIgnoreCase('Did not recieve a 200 status code: 500')) {
                caughtError = true;
            }
        }
        	
        Test.stopTest();
        System.assertEquals(true, caughtError);
    }
}