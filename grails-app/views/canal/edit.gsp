

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Canal</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Canal List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Canal</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Canal</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${canal}">
            <div class="errors">
                <g:renderErrors bean="${canal}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${canal?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numeroCanal">Numero Canal:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:canal,field:'numeroCanal','errors')}">
                                    <g:select id="numeroCanal" name="numeroCanal" from="${canal.constraints.numeroCanal.inList}" value="${canal.numeroCanal}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoBotao">Tipo Botao:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:canal,field:'tipoBotao','errors')}">
                                    <g:select id="tipoBotao" name="tipoBotao" from="${canal.constraints.tipoBotao.inList}" value="${canal.tipoBotao}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="app">App:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:canal,field:'app','errors')}">
                                    <g:select optionKey="id" from="${App.list()}" name="app.id" value="${canal?.app?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="textoAtivo">Texto Ativo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:canal,field:'textoAtivo','errors')}">
                                    <input type="text" id="textoAtivo" name="textoAtivo" value="${fieldValue(bean:canal,field:'textoAtivo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="textoInativo">Texto Inativo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:canal,field:'textoInativo','errors')}">
                                    <input type="text" id="textoInativo" name="textoInativo" value="${fieldValue(bean:canal,field:'textoInativo')}"/>
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
