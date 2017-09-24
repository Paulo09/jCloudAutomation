

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Acesso</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Acesso List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Acesso</g:link></span>
        </div>
        <div class="body">
            <h1>Show Acesso</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:acesso, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:acesso, field:'nome')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Obs:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:acesso, field:'obs')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Projeto:</td>
                            
                            <td valign="top" class="value"><g:link controller="projeto" action="show" id="${acesso?.projeto?.id}">${acesso?.projeto?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${acesso?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
