package tecpuc.aula.json.gson;

import java.lang.reflect.Type;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class JsonParaJavaListString {
	public static void main(String[] args) {
		
		// json //
		String json = "[\"victormenegusso@gmail.com\",\"teste@teste.com\",\"javeiro@php.com\"]";
		
		// --- convertendo para json --- //
		Gson gson = new Gson();
		
		Type tipoLista = new TypeToken<ArrayList<String>>() {}.getType();
		ArrayList<String> lista = gson.fromJson(json, tipoLista);
		
		// --- exibindo json --- //
		for(String item : lista)
		{
			System.out.println(item);
		}
	}
}
