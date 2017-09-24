<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<g:helpBalloons/>
        <title>Create App</title>         
    </head>
    <body>
       
        <div class="body">
            <h1>Create App</h1>
			 <div class="nav">
				<span class="menuButton"><a class="home" href="${createLinkTo(dir:'projeto/show/')}">Voltar</a></span>
				<span class="menuButton"><g:link class="list" action="list">App List</g:link></span>
			</div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${app}">
            <div class="errors">
                <g:renderErrors bean="${app}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="portaCom">Porta Com:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'portaCom','errors')}">
                                    <g:select class="input-box" id="portaCom" name="portaCom" from="${app.constraints.portaCom.inList}" value="${app.portaCom}" ></g:select>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
						        </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoArduino">Tipo Arduino:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'tipoArduino','errors')}">
                                    <g:select class="input-box" id="tipoArduino" name="tipoArduino" from="${app.constraints.tipoArduino.inList}" value="${app.tipoArduino}" ></g:select>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ip">Ip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'ip','errors')}">
                                    <input class="input-box" type="text" id="ip" name="ip" value="${fieldValue(bean:app,field:'ip')}"/>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="macadres">Macadres:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'macadres','errors')}">
                                    <input class="input-box" type="text" id="macadres" name="macadres" value="${fieldValue(bean:app,field:'macadres')}"/>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeApp">Nome App:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'nomeApp','errors')}">
                                    <input class="input-box" type="text" id="nomeApp" name="nomeApp" value="${fieldValue(bean:app,field:'nomeApp')}"/>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="porta">Porta:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'porta','errors')}">
                                    <input class="input-box" type="number" id="porta" name="porta" value="${fieldValue(bean:app,field:'porta')}"/>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projeto">Projeto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'projeto','errors')}">
                                    <g:select class="input-box" optionKey="id" from="${Projeto.list()}" name="projeto.id" value="${app?.projeto?.id}" ></g:select>
									<g:helpBalloon title="Descrição" content="Descreve sobre a Aplicação. Ex: Aplicação para informações sobre a framework jmoble."/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
