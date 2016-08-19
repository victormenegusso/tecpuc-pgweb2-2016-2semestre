package tecpuc.aula.json.gson;

import com.google.gson.Gson;

public class JsonParaJavaObject {

	public static void main(String[] args) {
		
		// --- texto json --- //
		String json = "{\"id\":1,\"nome\":\"Victor\",\"email\":\"victormenegusso@gmail.com\"}";
		
		// --- transformando em Objeto Java --- //
		Gson gson = new Gson(); // conversor
		Cliente objCliente = gson.fromJson(json, Cliente.class);
		
		// exibindo dados em Java //
		System.out.println( objCliente.getId() );
		System.out.println( objCliente.getNome() );
		System.out.println( objCliente.getEmail() );
	}

}
