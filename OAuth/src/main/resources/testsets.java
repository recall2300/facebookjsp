
public class testsets {
	
	public void test(){
		HttpsURLConnection.setDefaultHostnameVerifier(hv);
	      URL url = new URL("https://cab.tivlab.austin.ibm.com:9431/rest/model/"+
	            "Repository?depth=1&feed=json");
	      HttpsURLConnection urlConn = (HttpsURLConnection) url.openConnection();

	      System.out.println("sending request...");
	      urlConn.setRequestMethod("GET");
	      urlConn.setAllowUserInteraction(false); // no user interaction
	      urlConn.setDoOutput(true); // want to send
	      urlConn.setRequestProperty( "Content-type", "text/xml" );
	      urlConn.setRequestProperty( "accept", "text/xml" );
	      urlConn.setRequestProperty( "authorization", "Basic " + 
	          encode("administrator:collation"));
	      Map headerFields = urlConn.getHeaderFields();
	      System.out.println("header fields are: " + headerFields);

	      int rspCode = urlConn.getResponseCode();
	      if (rspCode == 200) {
	          InputStream ist = urlConn.getInputStream();
	          InputStreamReader isr = new InputStreamReader(ist);
	          BufferedReader br = new BufferedReader(isr);
	      
	          String nextLine = br.readLine();
	          while (nextLine != null) {
	              System.out.println(nextLine);
	              nextLine = br.readLine();
	          }
	      }
	}
	  
}
