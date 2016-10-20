package aula;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/cad")
public class CadastraProdutoServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("bbbbxxxxb");
	}
	/*
	protected void service (HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
		
		request.setAttribute("contato", "victor");
		System.out.println("bbb");
		RequestDispatcher rd = request.getRequestDispatcher("/cadastrarproduto.jsp");
		rd.forward(request,response);
		
	}
	*/
	
}
