import java.io.File;
class DiretorioserviceService {

    
	 boolean transactional = false
	
	def criarDiretorio(String caminho ){
	   
	    File dir = new File(caminho);
		if (dir.mkdir()) {  
		    //System.out.println("Diretorio criado com sucesso!");  
		} else {  
		    //System.out.println("Erro ao criar diretorio!");  
		} 
		return caminho;
	}
}
