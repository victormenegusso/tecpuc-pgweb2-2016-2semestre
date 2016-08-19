package tecpuc.aula.json.gson;

import java.util.ArrayList;

import com.google.gson.Gson;

public class JavaListClienteParaJson {
	public static void main(String[] args) {
		
		// lista de cliente //
		ArrayList<Cliente> lista = new ArrayList<Cliente>();
		Cliente novoCliente;
		
		novoCliente = new Cliente();
		novoCliente.setId(1);
		novoCliente.setNome("Victor");
		novoCliente.setEmail("victormenegusso@gmail.com");
		lista.add(novoCliente);
		
		novoCliente = new Cliente();
		novoCliente.setId(2);
		novoCliente.setNome("Stalone");
		novoCliente.setEmail("stalone@mercenario.com");
		lista.add(novoCliente);
		
		// --- convertendo para json --- //
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		
		// --- exibindo json --- //
		System.out.println(json);
	}
}
