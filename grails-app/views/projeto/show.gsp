<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Projeto</title>
    </head>
    <body>
        
        <div class="body">&nbsp;&nbsp;&nbsp;		    
            <h2 align="center"><font color="#ffffff">Dados do Projeto</h2>
			<div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'projeto/list')}">Voltar</a></span>
            <span class="menuButton"><g:link class="list" action="list">Projeto List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Projeto</g:link></span>
			</div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="odd">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:projeto, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">App:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${projeto.app}">
                                    <li><g:link controller="app" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Imagem:</td>
                            
                            <td><img src="/automation/projeto/imagemLink/${projeto.id}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:projeto, field:'nome')}</td>
                            
                        </tr>
                    
                        <tr class="odd">
                            <td valign="top" class="name">Responsavel:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:projeto, field:'responsavel')}</td>
                            
                        </tr>
						
				    
                    </tbody>
                </table>
            </div>
					
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${projeto?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Apagar os Dados?');" value="Delete" /></span>
					
					<% if(projeto){%>
						<g:each in="${projeto}" status="i" var="app">				
							<span class="button"><span class="menuButton"><a class="create" href="${createLinkTo(dir:'app/create/')}${projeto.id}">App</a></span></td></span>
						</g:each>
					<%}%>
					
					<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
					
                </g:form>
            </div>
        </div>
    </body>
</html>


<% if(projeto.app) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>App List</title>
    </head>
    <body>
        
        <div class="body">
            <h1><font color="#ffffff">Aplicação(ões)</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="portaCom" title="Porta Com" />
                        
                   	        <g:sortableColumn property="tipoArduino" title="Tipo Arduino" />
                        
                   	        <g:sortableColumn property="ip" title="Ip" />
                        
                   	        <g:sortableColumn property="macadres" title="Macadres" />
                        
                   	        <g:sortableColumn property="nomeApp" title="Nome App" />
							
							<g:sortableColumn property="nomeApp" title="Adicionar Canal" />
                        
                        </tr>
                    </thead>
                    <tbody>
					
					<g:each in="${projeto.app}" status="i" var="app">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${app.id}"><a class="create" href="${createLinkTo(dir:'app/show/')}${app.id}">${app.id}</a></g:link></td>
                        
                            <td>${fieldValue(bean:app, field:'portaCom')}</td>
                        
                            <td>${fieldValue(bean:app, field:'tipoArduino')}</td>
                        
                            <td>${fieldValue(bean:app, field:'ip')}</td>
                        
                            <td>${fieldValue(bean:app, field:'macadres')}</td>
                        
                            <td>${fieldValue(bean:app, field:'nomeApp')}</td>
							
							<td><span class="menuButton"><a class="create" href="${createLinkTo(dir:'canal/create/')}${app.id}">Canal</a></span></td>
                        
                        </tr>
				    </g:each>
                   
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${App.count()}" />
            </div>
        </div>
    </body>
</html>
<% } %>

