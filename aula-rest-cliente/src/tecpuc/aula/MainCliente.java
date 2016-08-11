package tecpuc.aula;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class MainCliente {

	public static void main(String[] args) throws IOException {

		String cpf = "07795153909";
		//String caminho = "http://www.bronzebusiness.com.br/webservices/valida.asmx/valida_cpf?cpf="+cpf;
		String caminho = "https://br.api.pvp.net/api/lol/br/v1.2/champion?freeToPlay=true&api_key=RGAPI-059F1713-3FA2-45BD-8D8A-760B02DC1740";
		URL url = new URL(caminho);
		InputStream inputStream = url.openConnection().getInputStream();
		BufferedReader bufferedReader = new BufferedReader(
				new InputStreamReader(inputStream));
		String line = null;
		
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println("e");
			System.out.println(line);
		}

	}

}
