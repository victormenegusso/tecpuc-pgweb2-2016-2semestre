package aula.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ServletUpload") // configura a url do servlet
@javax.servlet.annotation.MultipartConfig // indica que o formulário é multipart
public class ServletUpload  extends HttpServlet 
{
	// método chamado quando é acessada a url do servlet
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException 
	{
		Part filePart;
	    String nomeArquivo;
	    InputStream conteudoArquivo;
	    String diretorioSalvar = "/home/victor/";
	    	    
	    // obtendo o arquivo 1, o nome do arquivo vai gerado randomicamente//
	    filePart = request.getPart("arquivoUpload"); 
	    nomeArquivo = filePart.getSubmittedFileName();//UUID.randomUUID().toString();
	    conteudoArquivo = filePart.getInputStream(); 
	    
	    salvarArquivo(diretorioSalvar,nomeArquivo, conteudoArquivo);
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