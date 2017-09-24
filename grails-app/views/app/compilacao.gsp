

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show App</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">App List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New App</g:link></span>
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'/acesso/menu/')}${menu}">Menu</a></span>
			<span class="menuButton"><g:link class="compilacao" action="compilacao">Compilacao</g:link></span>
        </div>
        <div class="body">
            <h1>Show App</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                   
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${app?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
