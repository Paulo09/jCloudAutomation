

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Dados do Projeto</title>
    </head>
    <body>
        
        <div class="body">&nbsp;&nbsp;&nbsp;
            <h2 align="center"><font color="#ffffff">Dados do Projeto</h2>
			<div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'projeto/show/')}${app?.projeto?.id}">Voltar</a></span>
            <!--<span class="menuButton"><g:link class="list" action="list">App List</g:link></span>-->
            <!--<span class="menuButton"><g:link class="create" action="create">New App</g:link></span>-->
			<span class="menuButton"><a class="home" onclick="return confirm('Are you sure?');" href="${createLinkTo(dir:'/acesso/menu/')}${menu}">Menu</a></span>
			<span class="menuButton"><a class="home" onclick="return confirm('Deseja Compilar o projeto para o seu arduino?');" href="${createLinkTo(dir:'app/compilacao/')}${app.id}">Compilacao</a></span>
			</div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="odd">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Porta Com:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'portaCom')}</td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Tipo Arduino:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'tipoArduino')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Canal:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="c" in="${app.canal}">
                                    <li><g:link controller="canal" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Ip:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'ip')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Macadres:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'macadres')}</td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Nome App:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'nomeApp')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Porta:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:app, field:'porta')}</td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Projeto:</td>
                            
                            <td valign="top" class="value"><g:link controller="projeto" action="show" id="${app?.projeto?.id}">${app?.projeto?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
						
						<tr class="prop">
                            <td valign="top" class="name">Imagem Arduino:</td>
							<td><img src="${createLinkTo(dir:'images',file:'arduino mega.jpg')}" alt="Tipo Arduino" /></td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${app?.id}" />
                    <span class="button"><g:actionSubmit class="edit" onclick="return confirm('Deseja Editar os Dados da Aplicação?');" value="Editar a Aplicação?" action="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Apagar os Dados da Aplicação?');" value="Apagar Aplicação?" action="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
