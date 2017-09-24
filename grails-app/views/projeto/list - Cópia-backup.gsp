

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Projeto List</title>
    </head>
    <body>
        
        <div class="body">
            <h1>Projetos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                       
                    </thead>
                    <tbody>
                    <g:each in="${projetoList}" status="i" var="projeto">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'odd'}">
                        
                            <!--<td><g:link action="show" id="${projeto.id}">${fieldValue(bean:projeto, field:'id')}</g:link></td>-->
                             
                             <td><img src="${createLinkTo(dir:'images',file:'arduino.png')}" alt="Grails"/>      <g:link action="show" id="${projeto.id}">${fieldValue(bean:projeto, field:'nome')} > </g:link></td>
							
							<tr>
							<td colspan="8">
							<hr/></td>
							</tr>
					    
                            <!--<td>${fieldValue(bean:projeto, field:'responsavel')}</td>-->
                        
                        </tr>
                    </g:each>
					   <td><g:link class="create" action="create">Novo Projeto</g:link> | <g:link class="create" action="create">Menu Principal</g:link></td>
		            </tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
