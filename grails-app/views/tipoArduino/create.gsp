

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create TipoArduino</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TipoArduino List</g:link></span>
        </div>
        <div class="body">
            <h1>Create TipoArduino</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tipoArduino}">
            <div class="errors">
                <g:renderErrors bean="${tipoArduino}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caracteristicas">Caracteristicas:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tipoArduino,field:'caracteristicas','errors')}">
                                    <input type="text" id="caracteristicas" name="caracteristicas" value="${fieldValue(bean:tipoArduino,field:'caracteristicas')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao">Descricao:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tipoArduino,field:'descricao','errors')}">
                                    <input type="text" id="descricao" name="descricao" value="${fieldValue(bean:tipoArduino,field:'descricao')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foto">Foto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tipoArduino,field:'foto','errors')}">
                                    <input type="file" id="foto" name="foto" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tipoArduino,field:'nome','errors')}">
                                    <input type="text" id="nome" name="nome" value="${fieldValue(bean:tipoArduino,field:'nome')}"/>
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
