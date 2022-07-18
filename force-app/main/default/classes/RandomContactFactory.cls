//@isTest
public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lName) {
        //Initialize the empty contact list
        List<Contact> contactList = new List<Contact>();
        
        //for loop to create contacts
        for(Integer i = 0; i < numOfContacts; i++) {
            Contact c = new Contact(FirstName='Test '+ i, LastName=lname);
            contactList.add(c);
        }
        
        return contactList;
    }
}