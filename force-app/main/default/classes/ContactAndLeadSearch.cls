public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchString) {
        List<List<sObject>> searchlist = [
            FIND :searchString
            IN ALL FIELDS
            RETURNING Contact(Name), Lead(Name)
        ];
        
        System.debug(searchList);
        return searchList;
    }
}