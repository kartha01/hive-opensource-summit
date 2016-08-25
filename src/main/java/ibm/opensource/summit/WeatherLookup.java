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

public class WeatherLookup extends UDF{
	@Description(
	name="LocationLookup",
	value="returns '{Location info as JSON}', input (String apiKey, String zipCode, String date)",
	extended="SELECT weatherlookup(apiKey,zip,date) from foo limit 1;"
	)
	HttpUtils http=new HttpUtils();
	
	/*
	 * http://api.weather.com/v1/location/87031:4:US/observations/historical.json?units=m&startDate=20120101&endDate=20120101&apiKey=<apikey>
	 * For Details on Units of Measurement:
	 * https://docs.google.com/document/d/1nOmM3BvDohJ1T8dBRILLCXaeCPrO9W44y3mAzmp2kms/edit#heading=h.robgm5leraj9
	 */
	public Text evaluate(String apiKey, String zipCode, String date ) throws IOException {
		if((apiKey == null)||(zipCode==null)||(date==null)) return null;
		
		String apiURL_1="http://api.weather.com/v1/location/";
		String zip=zipCode+":4:US/observations/historical.json?units=e&"; //English Units
		String dates="startDate="+date+"&endDate="+date;
		String api="&apiKey="+apiKey;
		
		return new Text(http.getContents(apiURL_1+zip+dates+api));
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		WeatherLookup ll=new WeatherLookup();
		/*
		Response Code : 200
		{"status":"OK","addresses":[{"streetNumber":"146","streetName":"Quintana Rd","county":"Valencia","state":"New Mexico","postCode":"87031"}]}
		*/
		try {
			System.out.println(ll.evaluate("xxx", "87031","20120101" ));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

