

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show TipoArduino</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TipoArduino List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TipoArduino</g:link></span>
        </div>
        <div class="body">
            <h1>Show TipoArduino</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tipoArduino, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Caracteristicas:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tipoArduino, field:'caracteristicas')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Descricao:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tipoArduino, field:'descricao')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Foto:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tipoArduino, field:'foto')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tipoArduino, field:'nome')}</td>
                            
                        </tr>
						
						<tr class="prop">
                            <td valign="top" class="name">Imagem:</td>
                            <td><img width="300" src="/automation/tipoArduino/fotoLink/${tipoArduino.id}"/></td>
				        </tr>
						
						
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${tipoArduino?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
