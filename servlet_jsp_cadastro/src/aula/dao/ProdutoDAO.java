package aula.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import aula.entidade.Produto;

public class ProdutoDAO{
	// metodo para inserir no banco //
	public void inserir(String nome, int quantidade) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO produtos (nome,quantidade) values (?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome);
			comando.setInt(2, quantidade);

			// executando sql //
			comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
	}

	// metodo para inserir no banco //
	public void inserir(Produto novoProduto) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql = "INSERT INTO produtos (nome,quantidade) values (?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, novoProduto.getNome());
			comando.setInt(2, novoProduto.getQuantidade());

			// executando sql //
			comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
	}
}