package aula.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import aula.dao.ArquivoDAO;

@WebServlet("/ServletUpload")
@MultipartConfig // indica que o formulário é multipart
public class ServletUpload extends HttpServlet {

	// metodo chamado quando é acessada a url do servlet
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part filePart;

		// obtendo o arquivo, semelhante ao getParameter
		filePart = request.getPart("arquivoUpload");

		// obtendo informações do arquivo
		System.out.println(filePart.getContentType());
		System.out.println(filePart.getName());
		System.out.println(filePart.getSize());
		System.out.println(filePart.getSubmittedFileName());
		System.out.println(filePart.getInputStream());

		// salvando no computador
		String nome = UUID.randomUUID().toString();
		String dirNome = "/home/victor/";
		filePart.write(dirNome + nome);

		// salvando no banco //
		ArquivoDAO dao = new ArquivoDAO();
		dao.inserir(nome, filePart.getSubmittedFileName(), filePart.getContentType(), filePart.getSize());
	}
}