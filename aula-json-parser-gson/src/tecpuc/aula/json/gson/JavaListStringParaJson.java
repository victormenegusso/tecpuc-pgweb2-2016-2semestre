package tecpuc.aula.json.gson;

import java.util.ArrayList;

import com.google.gson.Gson;

public class JavaListStringParaJson {
	public static void main(String[] args) {
		
		// lista de texto //
		ArrayList<String> lista = new ArrayList<String>();
		lista.add("victormenegusso@gmail.com");
		lista.add("teste@teste.com");
		lista.add("javeiro@php.com");
		
		// --- convertendo para json --- //
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		
		// --- exibindo json --- //
		System.out.println(json);
	}
}
