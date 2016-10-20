package aula.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import aula.dao.ProdutoDAO;
import aula.entidade.Produto;

@WebServlet("/cadastrarproduto")
@MultipartConfig // indica que o formulário é multipart
public class ServletCadastrar extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// obtendo dados //
		String nome = request.getParameter("nome");
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
 
		// arquivo //
	    Part filePart = request.getPart("arquivoUpload"); 
	    String nomeArquivo = UUID.randomUUID().toString();
	    InputStream conteudoArquivo = filePart.getInputStream(); 

	    salvarArquivo("/home/victor/", nomeArquivo, conteudoArquivo);
	    
		// cadastrar no banco de dados //
		ProdutoDAO dao = new ProdutoDAO();
		dao.inserir(nome, quantidade,nomeArquivo);

		// redirecionando para o jsp tratar
		RequestDispatcher rd = request.getRequestDispatcher("/produtocadastradosucesso.jsp");
		rd.forward(request, response);
	}
	
	/**
	 * método que salva o arquivo na máquina 
	 * @param dirNome
	 * @param arqNome
	 * @param conteudo
	 */
	private void salvarArquivo(String dirNome, String arqNome, InputStream conteudo)
	{
		OutputStream outputStream = null;

		try 
		{
			outputStream = new FileOutputStream(new File(dirNome+arqNome));

			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = conteudo.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
			
			conteudo.close();
			outputStream.close();


		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
