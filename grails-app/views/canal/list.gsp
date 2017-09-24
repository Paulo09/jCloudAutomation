

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Canal List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Canal</g:link></span>
        </div>
        <div class="body">
            <h1>Canal List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="numeroCanal" title="Numero Canal" />
                        
                   	        <g:sortableColumn property="tipoBotao" title="Tipo Botao" />
                        
                   	        <th>App</th>
                   	    
                   	        <g:sortableColumn property="textoAtivo" title="Texto Ativo" />
                        
                   	        <g:sortableColumn property="textoInativo" title="Texto Inativo" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${canalList}" status="i" var="canal">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${canal.id}">${fieldValue(bean:canal, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:canal, field:'numeroCanal')}</td>
                        
                            <td>${fieldValue(bean:canal, field:'tipoBotao')}</td>
                        
                            <td>${fieldValue(bean:canal, field:'app')}</td>
                        
                            <td>${fieldValue(bean:canal, field:'textoAtivo')}</td>
                        
                            <td>${fieldValue(bean:canal, field:'textoInativo')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Canal.count()}" />
            </div>
        </div>
    </body>
</html>
