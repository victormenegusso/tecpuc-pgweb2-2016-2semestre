package aula.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import aula.entidade.Arquivo1;
import aula.entidade.Arquivo2;

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

	// método para inserir no banco //
	public void inserir(String nome, String content_type, long tamanho, InputStream conteudo) {
		try {
			// obtendo conexão //
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "root");

			// preparando a sql //
			String sql;
			sql = "INSERT INTO arquivos_2 (nome,content_type,tamanho,conteudo) values (?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, nome);
			comando.setString(2, content_type);
			comando.setLong(3, tamanho);
			comando.setBinaryStream(4, conteudo);

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

	public ArrayList<Arquivo2> listar2() {

		ArrayList<Arquivo2> listaArq = new ArrayList<Arquivo2>();
		Arquivo2 arq;
		Connection con = null;
		ResultSet rs;
		PreparedStatement comando;

		try {
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, "root", "root");

			String sql = "select * from arquivos_2";
			comando = con.prepareStatement(sql);

			rs = comando.executeQuery();
			while (rs.next()) {
				arq = new Arquivo2();
				arq.setId(rs.getInt("id"));
				arq.setNome(rs.getString("nome"));
				arq.setContentType(rs.getString("content_type"));
				arq.setTamanho(rs.getLong("tamanho"));

				// pegando o arquivo
				InputStream input = rs.getBinaryStream("conteudo");
				ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
				int reads = input.read();
				while(reads != -1)
				{ 
					baos.write(reads); 
					reads = input.read(); 
				}

				arq.setConteudo( baos.toByteArray() );

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
	
	
	public Arquivo2 pegarArquivo(int id) {
		Arquivo2 arq = null;
		Connection con = null;
		ResultSet rs;
		PreparedStatement comando;

		try {
			String URL = "jdbc:mysql://localhost:3306/aula";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, "root", "root");

			String sql = "select * from arquivos_2 where id = ?";
			comando = con.prepareStatement(sql);

			comando.setInt(1, id);
			rs = comando.executeQuery();
			if (rs.next()) {
				arq = new Arquivo2();
				arq.setId(rs.getInt("id"));
				arq.setNome(rs.getString("nome"));
				arq.setContentType(rs.getString("content_type"));
				arq.setTamanho(rs.getLong("tamanho"));

				// pegando o arquivo
				InputStream input = rs.getBinaryStream("conteudo");
				ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
				int reads = input.read();
				while(reads != -1)
				{ 
					baos.write(reads); 
					reads = input.read(); 
				}

				arq.setConteudo( baos.toByteArray() );

			}

			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}

		return arq;
	}
}
