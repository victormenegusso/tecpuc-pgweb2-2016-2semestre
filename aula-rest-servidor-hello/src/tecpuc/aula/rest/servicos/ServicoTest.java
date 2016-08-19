package tecpuc.aula.rest.servicos;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("meuservicorest")
public class ServicoTest {
	
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getTexto() {
        return "primeiro metodo 'GET' em rest";
    }
}
