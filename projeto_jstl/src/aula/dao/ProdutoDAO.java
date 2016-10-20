package aula.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import aula.entidade.Produto;

public class ProdutoDAO {
	// método para inserir no banco //
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

	// método para inserir no banco //
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

	public ArrayList<Produto> listar(){
		
		ArrayList<Produto> listaProduto = new ArrayList<Produto>();
		Produto novo_produto;
		Connection con = null;
		ResultSet rs;
		PreparedStatement comando;

		try
		{
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, "root", "root");
	
			String sql = "select * from produtos";
			comando = con.prepareStatement(sql);
	
			rs = comando.executeQuery();
			while (rs.next()) {
				novo_produto = new Produto();
				novo_produto.setId(rs.getInt("id"));
				novo_produto.setNome(rs.getString("nome"));
				novo_produto.setQuantidade(rs.getInt("quantidade"));
	
				listaProduto.add(novo_produto);
			}
			
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}

		return listaProduto;
	}
}
