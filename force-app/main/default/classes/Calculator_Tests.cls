@isTest
private class Calculator_Tests {
    @isTest
    static void testAddition() {
        Test.startTest();
        Integer result = Calculator.addition(3,1);
        Test.stopTest();
        System.assert(result == 4, 'Expected 3 + 1 to return 4.');
    }
    @isTest
    static void testSubtraction() {
        Test.startTest();
        Integer result = Calculator.subtraction(6,5);
        Test.stopTest();
        System.assert(result == 1,'Expected 6 - 5 to return 1');
    }
    @isTest
    static void testMultiplication() {
        Test.startTest();
        Integer result = Calculator.multiply(4,2);
        Test.stopTest();
        System.assert(result == 8, 'Expected 4 * 2 to return 8');
    }
    @isTest
    static void testMultiplicationException() {
        Boolean caughtError = false;
        Test.startTest();
        try {
            Calculator.multiply(2,0);
        } catch (Calculator.CalculatorException e) {
            if(e.getMessage().EqualsIgnoreCase('It doesn\'t make sense to multiply by zero')) {
                caughtError = true;
            }
        }
        Test.stopTest();
        System.assert(caughtError,'Expected an exception to be thrown for multiplying by zero');
    }
    @isTest
    static void testDivision() {
        Test.startTest();
        Decimal result = Calculator.divide(10,5);
        Test.stopTest();
        System.assert(result == 2.0, 'Expected 10 / 5 to return 2.0');
    }
    @isTest
    static void testZeroInDenominator() {
        Boolean caughtError = false;
        Test.startTest();
        try{
            Calculator.divide(10,0);
        } catch(Calculator.CalculatorException e) {
            if(e.getMessage().EqualsIgnoreCase('you still can\'t divide by zero')){
                caughtError = true;
            }
        }
        Test.stopTest();
        System.assert(caughtError, 'Expected dividing by zero to throw an error.');
    }
    @isTest
    static void testNegativeDivision() {
        Boolean caughtError = false;
        Test.startTest();
        try{
            Calculator.divide(-2,2);
        } catch (Calculator.CalculatorException e) {
            if(e.getMessage().EqualsIgnoreCase('Division returned a negative value.-1')){
                caughtError = true;
            }
        }
        Test.stopTest();
        System.assert(caughtError, 'Expected negative division to return an error');
    }
}