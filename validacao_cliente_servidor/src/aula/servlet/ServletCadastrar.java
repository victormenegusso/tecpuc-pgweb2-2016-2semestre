package aula.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aula.dao.ProdutoDAO;
import aula.entidade.Produto;

@WebServlet("/cadastrarproduto")
public class ServletCadastrar extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// obtendo dados //
		String nome = request.getParameter("nome");
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));

		// mostrar os dados no log //
		System.out.println(nome);
		System.out.println(quantidade);

		// validar os campos //
		String msgErro = "";
		if(nome.isEmpty())
		{
			msgErro = "corrigir o nome";
		}
		
		if(quantidade < 0)
		{
			msgErro+= "corrigir o quantidade";
		}
		
		if(msgErro.isEmpty())
		{
			// cadastrar no banco de dados //
			ProdutoDAO dao = new ProdutoDAO();
			dao.inserir(nome, quantidade);
			
			// redirecionando para o jsp tratar
			RequestDispatcher rd = request.getRequestDispatcher("/produtocadastradosucesso.jsp");
			rd.forward(request, response);
		}
		else
		{
			System.out.println(msgErro);
			
			// adicionando a msg de erro para o JSP tratar
			request.setAttribute("erroservidor", msgErro);
			
			RequestDispatcher rd = request.getRequestDispatcher("/cadastrarproduto.jsp");
			rd.forward(request, response);
		}


	}
}
