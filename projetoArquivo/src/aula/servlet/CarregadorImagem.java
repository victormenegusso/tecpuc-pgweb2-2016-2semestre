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

import com.sun.org.apache.regexp.internal.recompile;

@WebServlet("/CarregadorImagem")
public class CarregadorImagem extends HttpServlet 
{

    public CarregadorImagem() 
    {
    }
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException 
    {
    	
    	String imageId = request.getParameter("img");
    	
    	try
    	{
    		byte[] imageData = carregarImagem(imageId);
    	
    		response.setContentType("image/png");
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