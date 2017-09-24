import groovy.sql.Sql;
import java.io.File;
class AppController {
    def DiretorioserviceService
    def index = { redirect(action:list,params:params) }
	def con= Sql.newInstance("jdbc:postgresql://localhost:5432/automation","postgres","root","org.postgresql.Driver")
    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ appList: App.list( params ) ]
    }

    def show = {
	    
		def app = App.get( params.id )
		def ps = App.get( params.id ).canal.id
		def fore="",variaveis="",outpute="",lowe="",botoes="",condicao="",menu="",modelo=""
		def mar = DiretorioserviceService.criarDiretorio("ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id);
		
			con.eachRow("select * from canal where app_id="+app.id+"",{botoes +='EthernetSupW5100.addButton('+"${it.numero_canal}"+','+'"'+"${it.texto_ativo}"+'"'+','+ '"'+"${it.texto_inativo}"+'"'+","+"${it.tipo_botao}"    +');'+'\n'   });
			con.eachRow("select * from canal where app_id="+app.id+"",{variaveis +="int ${it.numero_canal} = "+"${it.numero_canal}".replace("Canal","")+';\n'});
			con.eachRow("select * from canal where app_id="+app.id+"",{outpute +='pinMode('+"${it.numero_canal}"+',OUTPUT);\n'});
			con.eachRow("select * from canal where app_id="+app.id+"",{lowe +='digitalWrite('+"${it.numero_canal}"+',LOW);\n'});
			con.eachRow("select * from canal where app_id="+app.id+"",{condicao+='if(lastButton == '+"${it.numero_canal}"+'){digitalWrite('+"${it.numero_canal}"+',state);};\n'});
			
			//Menu
			con.eachRow("select * from acesso where projeto_id="+app.projeto.id+"",{menu=it.id});
		    print "Menu:"+mar
		def conteudo='#include <SPI.h>\n'+
		             '#include "EthernetSupW5100.h"\n'+
					 'byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };\n'+
					 'IPAddress ip('+app.ip.replace(".",",")+');\n'+
					 'EthernetServer server('+app.porta+');\n'+
					 ''+variaveis+'\n'+
					 'void setup(){\n'+
					 'EthernetSupW5100.begin(mac, ip);\n'+
					 'server.begin();\n'+
					 '//Configurando as Portas dos Botoes\n'+
					 ''+outpute+'\n'+
					 '//Estado incial Portas\n'+
					 ''+lowe+'\n'+
					 '//Declarando os Botoes\n'+
					 ''+botoes+'\n'+
					 '}\n'+
					 'void loop(){\n'+
					 'EthernetSupW5100.loadHtml(server);\n'+
					 '//Verifica se algum botao foi pressionado\n'+
					 'int lastButton = EthernetSupW5100.getLastClickedButton();\n'+
					 'byte state = EthernetSupW5100.getButtonState(lastButton);\n'+
					 '//Executa o comando conforme o botao clicado\n'+
					 ''+condicao+'\n'+
					 '}\n'+					 
					 ''
		if(app.tipoArduino=='Arduino Uno')
		{
		  modelo=1
		}
		
		def criarapp = new FileWriter(new File("ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id+"\\"+app.nomeApp+app.id+'.dll'));
		    criarapp.write(conteudo); 
			criarapp.close();

		def conteudoCompilador='jmobile '+"ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id+"\\"+app.nomeApp+app.id+'.dll '+modelo+' '+app.portaCom
        def compilador = new FileWriter(new File("ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id+"\\"+app.nomeApp+"-"+app.id+'.bat'));		
		    compilador.write(conteudoCompilador); 
		    compilador.close();

		
		//def cmd = ["ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id+"\\"+app.nomeApp+"-"+app.id+".bat"]
	    //    cmd.execute().text	
		 
	    if(!app) {
            flash.message = "App not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ app : app,menu:menu ] }
    }
	
	def compilacao={
	     def app = App.get( params.id )
		 print "Resultado:"+app.projeto.nome
		 def cmd = ["ProjetosArduino\\"+app.projeto.nome+"-"+app.projeto.id+"\\"+app.nomeApp+"-"+app.id+".bat"]
	         cmd.execute().text
		redirect(action:show,id:app.id)	 
	}
	
	def fotoLink = {
	
	 if(params.id)
	 {
	   App app = App.findById(params.id)
	   
	   if(app)
	   {
	      response.outputStream << app.foto
	   }
	 }
	 
	}

    def delete = {
        def app = App.get( params.id )
        if(app) {
            app.delete()
            flash.message = "App ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "App not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def app = App.get( params.id )

        if(!app) {
            flash.message = "App not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ app : app ]
        }
    }

    def update = {
        def app = App.get( params.id )
        if(app) {
            app.properties = params
            if(!app.hasErrors() && app.save()) {
                flash.message = "App ${params.id} updated"
                redirect(action:show,id:app.id)
            }
            else {
                render(view:'edit',model:[app:app])
            }
        }
        else {
            flash.message = "App not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
	    def app = new App([projeto:Projeto.get(params.id)])
        app.properties = params
        return ['app':app]
    }

    def save ={
	
        def app = new App(params)
		if(!app.hasErrors() && app.save()) 
		{
            flash.message = "App ${app.id} created"
            //redirect(action:show,id:app.id)
			redirect(action:list)
			
        }
        else 
		{
            render(view:'create',model:[app:app])
        }
		
        
    }
}	