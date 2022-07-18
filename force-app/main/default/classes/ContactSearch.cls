public class ContactSearch {
    public static Contact[] searchForContacts(String lname, String mailCode) {
        
        //Create query
        Contact[] contactList = [
            SELECT Id, Name
            FROM Contact
            WHERE (LastName=:lname AND MailingPostalCode=:mailCode)
        ];
            System.debug(contactList);
            return(contactList);
    }
}