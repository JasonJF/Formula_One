public class NewCaseListController {
    //Initialize list to hold returned values
    
    public List<Case> getNewCases() {
        List<Case> newCases = new List<Case>();
        //Query DB for cases with status New
        newCases = [SELECT Id, CaseNumber FROM Case WHERE status = 'new'];
        
        return newCases;
    }
}