package tecpuc.aula.rest.servicos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import tecpuc.aula.rest.entidade.Livro;


@Path("livro")
@Produces({MediaType.APPLICATION_JSON})
public class ServicoLivro {

    @GET
    @Produces("application/json")
    public List<Livro> listar() 
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		
    		ArrayList<Livro> lst = new ArrayList<>();
    		
    		// 
    		String sql = "select * from livros";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next())
    		{
    			Livro u = new Livro();
    			u.setId( rs.getInt("id") );
    			u.setNome( rs.getString("nome") );
    			u.setAutor( rs.getString("autor") );
    			u.setDescricao( rs.getString("descricao") );
    			u.setEditora( rs.getString("editora") );
    			u.setGenero( rs.getString("genero") );
    			u.setOrigem( rs.getString("origem") );
    			
    			lst.add(u);
    		}
    		con.close();
    		return lst;
    	}
    	catch (Exception e) {
    		return new ArrayList<Livro>();
		}
    }
    
    @GET
    @Path("{id}")
    public Livro encontrar(@PathParam("id")	int	id)
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		    		
    		// 
    		String sql = "select * from livros where id=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, id);
    		ResultSet rs = ps.executeQuery();
    		
			Livro u = null;
    		if(rs.next())
    		{
    			u = new Livro();
    			u.setId( rs.getInt("id") );
    			u.setNome( rs.getString("nome") );
    			u.setAutor( rs.getString("autor") );
    			u.setDescricao( rs.getString("descricao") );
    			u.setEditora( rs.getString("editora") );
    			u.setGenero( rs.getString("genero") );
    			u.setOrigem( rs.getString("origem") );
    		}
    		con.close();
    		
    		if(u == null)
    			throw new WebApplicationException(404);
    		return u;
    	}
    	catch (Exception e) {
    		throw new WebApplicationException(404);
		}
    }
   
    @POST
    @Consumes({MediaType.APPLICATION_JSON})
    public Response criar(Livro u)
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		    		
    		// 
    		String sql = "insert into livros (nome,autor,descricao,editora,genero,origem) values (?,?,?,?,?,?) ";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, u.getNome());
    		ps.setString(2, u.getAutor());
    		ps.setString(3, u.getDescricao());
    		ps.setString(4, u.getEditora());
    		ps.setString(5, u.getGenero());
    		ps.setString(6, u.getOrigem());
    		
    		ps.executeUpdate();
    		
    		con.close();
    	}
    	catch (Exception e) {
    		throw new WebApplicationException(404);
		}
    	
    	return Response.status(201).entity(u).build();
    }
    
    @GET
    @Produces("application/json")
    @Path("buscar")
    public List<Livro> listarNome(@QueryParam("nome") String nome) 
    {
    	try
    	{
    		InitialContext ctx = new InitialContext();
    		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tecpuc_rest");
    		Connection con = ds.getConnection();
    		
    		ArrayList<Livro> lst = new ArrayList<>();
    		
    		// 
    		String sql = "select * from livros where  LOWER(nome) like ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, "%"+nome.toLowerCase()+"%");
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next())
    		{
    			Livro u = new Livro();
    			u.setId( rs.getInt("id") );
    			u.setNome( rs.getString("nome") );
    			u.setAutor( rs.getString("autor") );
    			u.setDescricao( rs.getString("descricao") );
    			u.setEditora( rs.getString("editora") );
    			u.setGenero( rs.getString("genero") );
    			u.setOrigem( rs.getString("origem") );
    			
    			lst.add(u);
    		}
    		con.close();
    		return lst;
    	}
    	catch (Exception e) {
    		return new ArrayList<Livro>();
		}
    }
}