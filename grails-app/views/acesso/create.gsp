

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Acesso</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Acesso List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Acesso</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${acesso}">
            <div class="errors">
                <g:renderErrors bean="${acesso}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:acesso,field:'nome','errors')}">
                                    <input type="text" id="nome" name="nome" value="${fieldValue(bean:acesso,field:'nome')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs">Obs:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:acesso,field:'obs','errors')}">
                                    <input type="text" id="obs" name="obs" value="${fieldValue(bean:acesso,field:'obs')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projeto">Projeto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:acesso,field:'projeto','errors')}">
                                    <g:select optionKey="id" from="${Projeto.list()}" name="projeto.id" value="${acesso?.projeto?.id}" ></g:select>
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
