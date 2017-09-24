class TipoArduinoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ tipoArduinoList: TipoArduino.list( params ) ]
    }

    def show = {
        def tipoArduino = TipoArduino.get( params.id )

        if(!tipoArduino) {
            flash.message = "TipoArduino not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tipoArduino : tipoArduino ] }
    }
	
	def fotoLink = {
	
	 if(params.id)
	 {
	   TipoArduino tipoArduino = TipoArduino.findById(params.id)
	   
	   if(tipoArduino)
	   {
	      response.outputStream << tipoArduino.foto
	   }
	 }
	 
	}

    def delete = {
        def tipoArduino = TipoArduino.get( params.id )
        if(tipoArduino) {
            tipoArduino.delete()
            flash.message = "TipoArduino ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "TipoArduino not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tipoArduino = TipoArduino.get( params.id )

        if(!tipoArduino) {
            flash.message = "TipoArduino not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tipoArduino : tipoArduino ]
        }
    }

    def update = {
        def tipoArduino = TipoArduino.get( params.id )
        if(tipoArduino) {
            tipoArduino.properties = params
            if(!tipoArduino.hasErrors() && tipoArduino.save()) {
                flash.message = "TipoArduino ${params.id} updated"
                redirect(action:show,id:tipoArduino.id)
            }
            else {
                render(view:'edit',model:[tipoArduino:tipoArduino])
            }
        }
        else {
            flash.message = "TipoArduino not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def tipoArduino = new TipoArduino()
        tipoArduino.properties = params
        return ['tipoArduino':tipoArduino]
    }

    def save = {
        def tipoArduino = new TipoArduino(params)
        if(!tipoArduino.hasErrors() && tipoArduino.save()) {
            flash.message = "TipoArduino ${tipoArduino.id} created"
            redirect(action:show,id:tipoArduino.id)
        }
        else {
            render(view:'create',model:[tipoArduino:tipoArduino])
        }
    }
}
