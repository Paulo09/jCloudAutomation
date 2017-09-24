

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Projeto</title>         
    </head>
    <body>
        
        <div class="body">
            &nbsp;&nbsp;&nbsp;
            <h2 align="center"><font color="#ffffff">Dados do Projeto</h2>
			<div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Projeto List</g:link></span>
			</div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projeto}">
            <div class="errors">
                <g:renderErrors bean="${projeto}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
