package ibm.opensource.summit;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.hadoop.hive.ql.exec.Description;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;

public class LocationLookup extends UDF {
	@Description(
	name="LocationLookup",
	value="returns '{Location info as JSON}'",
	extended="SELECT locationlookup(lat,lon) from foo limit 1;"
	)
	HttpUtils http=new HttpUtils();
	private final String USER_AGENT = "Mozilla/5.0";
	
	public Text evaluate(double latitude, double longitude) throws IOException {
		if((latitude == 0)&&(longitude==0)) return null;
			
		String baseURL="http://50.22.241.58/sts/api/reverse-geocode?";
		String lat="lat="+latitude;
		String lon="&long="+longitude;
				
		return new Text(http.getContents(baseURL+lat+lon));	
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		LocationLookup ll=new LocationLookup();
		/*
		Response Code : 200
		{"status":"OK","addresses":[{"streetNumber":"146","streetName":"Quintana Rd","county":"Valencia","state":"New Mexico","postCode":"87031"}]}
		*/
		try {
			System.out.println(ll.evaluate(34.78300117, -106.8952497));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

