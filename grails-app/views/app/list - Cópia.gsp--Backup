

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>App List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New App</g:link></span>
        </div>
        <div class="body">
            <h1>App List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="portaCom" title="Porta Com" />
                        
                   	        <g:sortableColumn property="tipoArduino" title="Tipo Arduino" />
                        
                   	        <g:sortableColumn property="ip" title="Ip" />
                        
                   	        <g:sortableColumn property="macadres" title="Macadres" />
                        
                   	        <g:sortableColumn property="nomeApp" title="Nome App" />
							
							<g:sortableColumn property="nomeApp" title="Adicionar Canal" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appList}" status="i" var="app">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${app.id}">${fieldValue(bean:app, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:app, field:'portaCom')}</td>
                        
                            <td>${fieldValue(bean:app, field:'tipoArduino')}</td>
                        
                            <td>${fieldValue(bean:app, field:'ip')}</td>
                        
                            <td>${fieldValue(bean:app, field:'macadres')}</td>
                        
                            <td>${fieldValue(bean:app, field:'nomeApp')}</td>
							
							<td><span class="menuButton"><a class="create" href="${createLinkTo(dir:'canal/create/')}${app.id}">Canal</a></span></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${App.count()}" />
            </div>
        </div>
    </body>
</html>
