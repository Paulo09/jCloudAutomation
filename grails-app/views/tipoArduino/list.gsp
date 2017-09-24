

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TipoArduino List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New TipoArduino</g:link></span>
        </div>
        <div class="body">
            <h1>TipoArduino List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="caracteristicas" title="Caracteristicas" />
                        
                   	        <g:sortableColumn property="descricao" title="Descricao" />
                        
                   	        <g:sortableColumn property="foto" title="Foto" />
                        
                   	        <g:sortableColumn property="nome" title="Nome" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tipoArduinoList}" status="i" var="tipoArduino">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tipoArduino.id}">${fieldValue(bean:tipoArduino, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:tipoArduino, field:'caracteristicas')}</td>
                        
                            <td>${fieldValue(bean:tipoArduino, field:'descricao')}</td>
                        
                            <td>${fieldValue(bean:tipoArduino, field:'foto')}</td>
                        
                            <td>${fieldValue(bean:tipoArduino, field:'nome')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${TipoArduino.count()}" />
            </div>
        </div>
    </body>
</html>
