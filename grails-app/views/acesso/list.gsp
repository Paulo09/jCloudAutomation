

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Acesso List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Acesso</g:link></span>
        </div>
        <div class="body">
            <h1>Acesso List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="nome" title="Nome" />
                        
                   	        <g:sortableColumn property="obs" title="Obs" />
                        
                   	        <th>Projeto</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${acessoList}" status="i" var="acesso">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${acesso.id}">${fieldValue(bean:acesso, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:acesso, field:'nome')}</td>
                        
                            <td>${fieldValue(bean:acesso, field:'obs')}</td>
                        
                            <td>${fieldValue(bean:acesso, field:'projeto')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Acesso.count()}" />
            </div>
        </div>
    </body>
</html>
