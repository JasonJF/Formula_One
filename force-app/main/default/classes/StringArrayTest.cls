public class StringArrayTest {
    public static String[] generateStringArray(Integer i) {
        //initialize array to return
        String[] arr = new List<String>();
        
        //add elements to array
        for(Integer j=0; j < i; j++) {
            arr.add('Test ' + j);
        }
        
        System.debug(arr);
        return arr;
    }
}