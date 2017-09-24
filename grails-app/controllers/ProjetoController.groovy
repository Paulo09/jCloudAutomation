class ProjetoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ projetoList: Projeto.list( params ) ]
    }

    def show = {
        def projeto = Projeto.get( params.id )

        if(!projeto) {
            flash.message = "Projeto not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ projeto : projeto ] }
    }
	
	def imagemLink = {
	
	 if(params.id)
	 {
	   Projeto projeto = Projeto.findById(params.id)
	   
	   if(projeto)
	   {
	      response.outputStream << projeto.imagem
	   }
	 }
	 
	}

    def delete = {
        def projeto = Projeto.get( params.id )
        if(projeto) {
            projeto.delete()
            flash.message = "Projeto ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Projeto not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def projeto = Projeto.get( params.id )

        if(!projeto) {
            flash.message = "Projeto not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ projeto : projeto ]
        }
    }

    def update = {
        def projeto = Projeto.get( params.id )
        if(projeto) {
            projeto.properties = params
            if(!projeto.hasErrors() && projeto.save()) {
                flash.message = "Projeto ${params.id} updated"
                redirect(action:show,id:projeto.id)
            }
            else {
                render(view:'edit',model:[projeto:projeto])
            }
        }
        else {
            flash.message = "Projeto not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def projeto = new Projeto()
        projeto.properties = params
        return ['projeto':projeto]
    }

    def save = {
        def projeto = new Projeto(params)
        if(!projeto.hasErrors() && projeto.save()) {
            flash.message = "Projeto ${projeto.id} created"
            redirect(action:show,id:projeto.id)
        }
        else {
            render(view:'create',model:[projeto:projeto])
        }
    }
}
