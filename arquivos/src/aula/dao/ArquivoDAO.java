package aula.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import aula.entidade.Arquivo1;

public class ArquivoDAO {

	// método para inserir no banco //
	public void inserir(String codigo, String nome, String content_type, long tamanho) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql;
			sql = "INSERT INTO arquivos_1 (codigo,nome,content_type,tamanho) values (?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, codigo);
			comando.setString(2, nome);
			comando.setString(3, content_type);
			comando.setLong(4, tamanho);

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

	public ArrayList<Arquivo1> listar() {

		ArrayList<Arquivo1> listaArq = new ArrayList<Arquivo1>();
		Arquivo1 arq;
		Connection con = null;
		ResultSet rs;
		PreparedStatement comando;

		try {
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, "root", "root");

			String sql = "select * from arquivos_1";
			comando = con.prepareStatement(sql);

			rs = comando.executeQuery();
			while (rs.next()) {
				arq = new Arquivo1();
				arq.setCodigo(rs.getString("codigo"));
				arq.setNome(rs.getString("nome"));
				arq.setContentType(rs.getString("content_type"));
				arq.setTamanho(rs.getLong("tamanho"));

				listaArq.add(arq);
			}

			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}

		return listaArq;
	}
}
