package aula.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import aula.entidade.Funcionario;

public class FuncionarioDAO {
	
	private Connection obterConexao() throws Exception
	{
		String URL = "jdbc:mysql://localhost:3306/aula";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, "root", "root");
		return con;
	}
	
	// método para inserir no banco //
	public void inserir(Funcionario novoFuncionario) {
		try {
			// obtendo conexão //
			Connection con = obterConexao();
			
			// preparando a sql //
			String sql = "INSERT INTO funcionarios (cpf,nome,setor,cargo,salario) values (?,?,?,?,?)";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, novoFuncionario.getCpf());
			comando.setString(2, novoFuncionario.getNome());
			comando.setString(3, novoFuncionario.getSetor());
			comando.setString(4, novoFuncionario.getCargo());
			comando.setDouble(5, novoFuncionario.getSalario());

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
	
	public boolean excluir(String cpf) {
		int quantidadeLinhas = 0;
		try {
			// obtendo conexão //
			Connection con = obterConexao();
			
			// preparando a sql //
			String sql = "delete from funcionarios where cpf = ?";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setString(1, cpf);

			// executando sql //
			quantidadeLinhas = comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
		
		if(quantidadeLinhas > 0)
			return true;
		else
			return false;
	}
	
	public boolean editarSalario(String cpf, double novoSalario) {
		int quantidadeLinhas = 0;
		try {
			// obtendo conexão //
			Connection con = obterConexao();
			
			// preparando a sql //
			String sql = "update funcionarios set salario = ? where cpf = ?";
			PreparedStatement comando = con.prepareStatement(sql);
			comando.setDouble(1, novoSalario);
			comando.setString(2, cpf);

			// executando sql //
			quantidadeLinhas = comando.executeUpdate();

			// fechando
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}
		
		if(quantidadeLinhas > 0)
			return true;
		else
			return false;
	}

	public ArrayList<Funcionario> listar(){
		
		ArrayList<Funcionario> listaFuncionario = new ArrayList<Funcionario>();
		Funcionario func;
		ResultSet rs;
		PreparedStatement comando;

		try
		{
			Connection con = obterConexao();
	
			String sql = "select * from funcionarios";
			comando = con.prepareStatement(sql);
	
			rs = comando.executeQuery();
			while (rs.next()) {
				func = new Funcionario();
				func.setCpf( rs.getString("cpf") );
				func.setNome( rs.getString("nome") );
				func.setSetor( rs.getString("setor") );
				func.setCargo( rs.getString("cargo") );
				func.setSalario( rs.getDouble("salario") );
	
				listaFuncionario.add(func);
			}
			
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}

		return listaFuncionario;
	}
	
	public ArrayList<Funcionario> listarSalariosMaior(Double valor){
		
		ArrayList<Funcionario> listaFuncionario = new ArrayList<Funcionario>();
		Funcionario func;
		ResultSet rs;
		PreparedStatement comando;

		try
		{
			Connection con = obterConexao();
	
			String sql = "select * from funcionarios where salario > ?";
			comando = con.prepareStatement(sql);
			comando.setDouble(1, valor);
	
			rs = comando.executeQuery();
			while (rs.next()) {
				func = new Funcionario();
				func.setCpf( rs.getString("cpf") );
				func.setNome( rs.getString("nome") );
				func.setSetor( rs.getString("setor") );
				func.setCargo( rs.getString("cargo") );
				func.setSalario( rs.getDouble("salario") );
	
				listaFuncionario.add(func);
			}
			
			comando.close();
			con.close();
		} catch (Exception e) {
			// imprimir o erro no console //
			e.printStackTrace();
		}

		return listaFuncionario;
	}
}
