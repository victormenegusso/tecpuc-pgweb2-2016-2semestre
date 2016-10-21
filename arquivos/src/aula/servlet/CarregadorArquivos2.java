package aula.servlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aula.dao.ArquivoDAO;
import aula.entidade.Arquivo2;

@WebServlet("/CarregadorArquivos2")
public class CarregadorArquivos2 extends HttpServlet 
{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException 
    {
    	
    	int id = Integer.parseInt( request.getParameter("id") );
    	ArquivoDAO dao =  new ArquivoDAO();
    	
    	Arquivo2 arq = dao.pegarArquivo(id);
    	if(arq != null)
    	{
    		byte[] imageData = arq.getConteudo();
    		
        	response.setContentType(arq.getContentType());
        	response.getOutputStream().write(imageData);
    	}
    	else {
    		response.sendError(404);
    	}
    }

    private static byte[] carregarImagem(String path) throws FileNotFoundException, IOException {

        byte[] image;
        File file = new File(path);
        image = new byte[(int)file.length()];

        FileInputStream fileInputStream = new FileInputStream(file);
        fileInputStream.read(image);

        fileInputStream.close();
        return image;
    }
}