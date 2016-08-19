package tecpuc.aula;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ClienteGetBasico 
{
	public static void main(String[] args) {
		try{
			URL url = new URL("http://localhost:8080/aula-rest-servidor/webapi/usuario");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			if (conn.getResponseCode() != 200) {
				System.out.print("deu erro... HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output,json="";
			while ((output = br.readLine()) != null) {
				json+= output;
			}
			System.out.println(json);
			conn.disconnect();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
