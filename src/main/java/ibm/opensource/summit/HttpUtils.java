package ibm.opensource.summit;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpUtils {
	private final String USER_AGENT = "Mozilla/5.0";
	URL obj =null;
	HttpURLConnection con=null;
	
	public String getContents(String lookupURL) throws IOException{
		URL obj = new URL(lookupURL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		con.setRequestMethod("GET");


		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();
		//System.out.println("\nSending 'GET' request to URL : " + lookupURL);
		//System.out.println("Response Code : " + responseCode);
		InputStreamReader ir = null;
		if (responseCode == 400) {
			ir = new InputStreamReader(con.getErrorStream());

		} else {
			ir = new InputStreamReader(con.getInputStream());
		}
		BufferedReader in = new BufferedReader(ir);
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
	}
}

