

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Projeto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Projeto List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Projeto</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Projeto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projeto}">
            <div class="errors">
                <g:renderErrors bean="${projeto}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <input type="hidden" name="id" value="${projeto?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="app">App:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'app','errors')}">
                                    
<ul>
<g:each var="a" in="${projeto?.app?}">
    <li><g:link controller="app" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="app" params="['projeto.id':projeto?.id]" action="create">Add App</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataCadastro">Data Cadastro:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'dataCadastro','errors')}">
                                    <g:datePicker name="dataCadastro" value="${projeto?.dataCadastro}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao">Descricao:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'descricao','errors')}">
                                    <input type="text" id="descricao" name="descricao" value="${fieldValue(bean:projeto,field:'descricao')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="esquemaEletrico">Esquema Eletrico:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'esquemaEletrico','errors')}">
                                    <input type="file" id="esquemaEletrico" name="esquemaEletrico" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fimProjeto">Fim Projeto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'fimProjeto','errors')}">
                                    <g:datePicker name="fimProjeto" value="${projeto?.fimProjeto}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imagem">Imagem:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'imagem','errors')}">
                                    <input type="file" id="imagem" name="imagem" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="incioProjeto">Incio Projeto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'incioProjeto','errors')}">
                                    <g:datePicker name="incioProjeto" value="${projeto?.incioProjeto}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'nome','errors')}">
                                    <input type="text" id="nome" name="nome" value="${fieldValue(bean:projeto,field:'nome')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="responsavel">Responsavel:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projeto,field:'responsavel','errors')}">
                                    <input type="text" id="responsavel" name="responsavel" value="${fieldValue(bean:projeto,field:'responsavel')}"/>
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
