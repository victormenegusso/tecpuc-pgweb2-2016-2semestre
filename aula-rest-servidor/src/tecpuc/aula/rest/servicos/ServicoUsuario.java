package tecpuc.aula.rest.servicos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;



import tecpuc.aula.rest.entidade.Usuario;


/**
 * Root resource (exposed at "myresource" path)
 */
@Path("usuario")
@Produces({MediaType.APPLICATION_JSON})
public class ServicoUsuario {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces("application/json")
    public List<Usuario> listar() 
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		
    		ArrayList<Usuario> lst = new ArrayList<>();
    		
    		// 
    		String sql = "select * from usuarios";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next())
    		{
    			Usuario u = new Usuario();
    			u.setId( rs.getInt("id") );
    			u.setNome( rs.getString("nome") );
    			u.setEmail( rs.getString("email") );
    			u.setPapel( rs.getString("papel") );
    			
    			lst.add(u);
    		}
    		
    		return lst;
    	}
    	catch (Exception e) {
    		return new ArrayList<Usuario>();
		}
    }
    
    @GET
    @Path("{id}")
    public Usuario encontrar(@PathParam("id")	int	id)
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		    		
    		// 
    		String sql = "select * from usuarios where id=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, id);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next())
    		{
    			Usuario u = new Usuario();
    			u.setId( rs.getInt("id") );
    			u.setNome( rs.getString("nome") );
    			u.setEmail( rs.getString("email") );
    			u.setPapel( rs.getString("papel") );
    			
    			return u;
    		}
    		
    		throw new WebApplicationException(404);
    	}
    	catch (Exception e) {
    		throw new WebApplicationException(404);
		}
    }
    
    @POST
    public void criar(@FormParam("nome") String nome, @FormParam("email") String email,
    		@FormParam("senha") String senha, @FormParam("papel") String papel)
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		    		
    		// 
    		String sql = "insert into usuarios (nome,email,senha,papel) values (?,?,?,?) ";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, nome);
    		ps.setString(2, email);
    		ps.setString(3, senha);
    		ps.setString(4, papel);
    		
    		ps.executeUpdate();
    	}
    	catch (Exception e) {
    		throw new WebApplicationException(404);
		}
    }
}