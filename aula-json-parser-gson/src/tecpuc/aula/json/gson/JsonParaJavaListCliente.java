package tecpuc.aula.json.gson;

import java.lang.reflect.Type;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class JsonParaJavaListCliente {
	public static void main(String[] args) {
		
		// json //
		String json = "[{\"id\":1,\"nome\":\"Victor\",\"email\":\"victormenegusso@gmail.com\"},{\"id\":2,\"nome\":\"Stalone\",\"email\":\"stalone@mercenario.com\"}]";
		
		// --- convertendo para json --- //
		Gson gson = new Gson();
		
		Type tipoLista = new TypeToken<ArrayList<Cliente>>() {}.getType();
		ArrayList<Cliente> lista = gson.fromJson(json, tipoLista);
		
		// --- exibindo dados --- //
		for(Cliente cliente : lista)
		{
			System.out.println(cliente.getId());
			System.out.println(cliente.getNome());
			System.out.println(cliente.getEmail());
		}
	}
}
