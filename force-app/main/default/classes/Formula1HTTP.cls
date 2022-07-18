public class Formula1HTTP {
    public static Race getStageInfo(String stageId){
        
		String stage = stageId;
        Race newRace = new Race();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.sportradar.us/formula1/trial/v2/en/sport_events/'+stage+'/summary.json?api_key=m7p9me68yuqa8b44axde9s7g');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
    
        //if the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            //Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            newRace = Race.parse(response.getBody());
            //Cast the values in the 'animals' key as a list
            //List<Object> animals = (List<Object>) results.get('animals');
            //System.debug('Stage Information:');
            /*for(Object animal: animals) {
                System.debug(animal);
            }*/
           
        }
        return newRace;
    }
}