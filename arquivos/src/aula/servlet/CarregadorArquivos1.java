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

@WebServlet("/CarregadorArquivos1")
public class CarregadorArquivos1 extends HttpServlet 
{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException 
    {
    	
    	String pathBase = "/home/victor/";
    	String codigo = request.getParameter("c");
    	String content_type = request.getParameter("ct");
    	try
    	{
    		byte[] imageData = carregarImagem(pathBase+codigo);
    		
        	response.setContentType(content_type);
        	response.getOutputStream().write(imageData);
    	}
    	catch (Exception e) {
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