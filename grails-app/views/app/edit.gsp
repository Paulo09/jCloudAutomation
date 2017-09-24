

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit App</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">App List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New App</g:link></span>
        </div>
        <div class="body">
            <h1>Edit App</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${app}">
            <div class="errors">
                <g:renderErrors bean="${app}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${app?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="portaCom">Porta Com:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'portaCom','errors')}">
                                    <g:select id="portaCom" name="portaCom" from="${app.constraints.portaCom.inList}" value="${app.portaCom}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoArduino">Tipo Arduino:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'tipoArduino','errors')}">
                                    <g:select id="tipoArduino" name="tipoArduino" from="${app.constraints.tipoArduino.inList}" value="${app.tipoArduino}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="canal">Canal:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'canal','errors')}">
                                    
<ul>
<g:each var="c" in="${app?.canal?}">
    <li><g:link controller="canal" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="canal" params="['app.id':app?.id]" action="create">Add Canal</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ip">Ip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'ip','errors')}">
                                    <input type="text" id="ip" name="ip" value="${fieldValue(bean:app,field:'ip')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="macadres">Macadres:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'macadres','errors')}">
                                    <input type="text" id="macadres" name="macadres" value="${fieldValue(bean:app,field:'macadres')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeApp">Nome App:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'nomeApp','errors')}">
                                    <input type="text" id="nomeApp" name="nomeApp" value="${fieldValue(bean:app,field:'nomeApp')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="porta">Porta:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'porta','errors')}">
                                    <input type="text" id="porta" name="porta" value="${fieldValue(bean:app,field:'porta')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projeto">Projeto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:app,field:'projeto','errors')}">
                                    <g:select optionKey="id" from="${Projeto.list()}" name="projeto.id" value="${app?.projeto?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
