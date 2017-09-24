import groovy.sql.Sql;
class AcessoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ acessoList: Acesso.list( params ) ]
    }

    def show = {
        def acesso = Acesso.get( params.id )

        if(!acesso) {
            flash.message = "Acesso not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ acesso : acesso ] }
    }
	
	def menu = {
	    
		def con= Sql.newInstance("jdbc:postgresql://localhost:5432/automation","postgres","root","org.postgresql.Driver")
		def acesso = Acesso.get( params.id )
		def listamenu=""
		con.eachRow("select * from app where projeto_id='"+acesso.projeto.id+"' order by id desc",{listamenu +="<div data-role='content'><a data-role='button'  data-theme='a' href='http://${it.ip}' class='super button </div>'>${it.nome_App}</a></div>"});
		def numeroArrei = Acesso.get( params.id ).projeto.app.nomeApp
	    if(!acesso) {
            flash.message = "Acesso not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ acesso : acesso,listamenu:listamenu,numeroArrei:numeroArrei] }
	}

    def delete = {
        def acesso = Acesso.get( params.id )
        if(acesso) {
            acesso.delete()
            flash.message = "Acesso ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Acesso not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def acesso = Acesso.get( params.id )

        if(!acesso) {
            flash.message = "Acesso not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ acesso : acesso ]
        }
    }

    def update = {
        def acesso = Acesso.get( params.id )
        if(acesso) {
            acesso.properties = params
            if(!acesso.hasErrors() && acesso.save()) {
                flash.message = "Acesso ${params.id} updated"
                redirect(action:show,id:acesso.id)
            }
            else {
                render(view:'edit',model:[acesso:acesso])
            }
        }
        else {
            flash.message = "Acesso not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def acesso = new Acesso()
        acesso.properties = params
        return ['acesso':acesso]
    }

    def save = {
        def acesso = new Acesso(params)
        if(!acesso.hasErrors() && acesso.save()) {
            flash.message = "Acesso ${acesso.id} created"
            redirect(action:show,id:acesso.id)
        }
        else {
            render(view:'create',model:[acesso:acesso])
        }
    }
}
