import groovy.sql.Sql;
class CanalController {
    
    def index = { redirect(action:list,params:params) }
    def con= Sql.newInstance("jdbc:postgresql://localhost:5432/automation","postgres","root","org.postgresql.Driver")
    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ canalList: Canal.list( params ) ]
    }

    def show = {
        def canal = Canal.get( params.id )
        
        if(!canal) {
            flash.message = "Canal not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ canal : canal ] }
    }

    def delete = {
        def canal = Canal.get( params.id )
        if(canal) {
            canal.delete()
            flash.message = "Canal ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Canal not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def canal = Canal.get( params.id )

        if(!canal) {
            flash.message = "Canal not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ canal : canal ]
        }
    }

    def update = {
        def canal = Canal.get( params.id )
        if(canal) {
            canal.properties = params
            if(!canal.hasErrors() && canal.save()) {
                flash.message = "Canal ${params.id} updated"
                //redirect(action:show,id:canal.id)
				redirect(url:"/automation/app/show/${canal.app.id}")
            }
            else {
                render(view:'edit',model:[canal:canal])
            }
        }
        else {
            flash.message = "Canal not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def canal = new Canal([app:App.get(params.id)])
        canal.properties = params
        return ['canal':canal]
    }

    def save = {
	
	    def canal = new Canal(params)
		def valor="",nomeProjeto="",nomeAplicacao=""
		con.eachRow("select * from canal where app_id="+params.app.id+" and numero_canal='"+params.numeroCanal+"'",{valor=it.id});
		con.eachRow("select * from app where id="+params.app.id+"",{nomeAplicacao=it.nome_app});
		con.eachRow("select * from app where id="+params.app.id+"",{nomeProjeto=it.projeto_id});
		con.eachRow("select * from projeto where id="+nomeProjeto+"",{nomeProjeto=it.nome});
		if(valor)
		{
		  flash.message = "Na Aplicação:${nomeAplicacao} do Projeto:${nomeProjeto}, já está usando o Canal:${params.numeroCanal}, obs. mudar Canal, pois não compilará."
		  redirect(action:create)
		}
		else
		{
			if(!canal.hasErrors() && canal.save()) 
			{
			 flash.message = "Canal ${canal.id} created"
			 //redirect(action:show,id:canal.id)
			 redirect(url:"/automation/app/show/${canal.app.id}")
			}
            else 
			{
             render(view:'create',model:[canal:canal])
            }
		}
        
    }
}
