<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <h2 style="margin-left:20px;"><font color="#ffffff">Seja Bem vindo ao jMobile Automation</h2>
        <p style="margin-left:20px;width:80%"></p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}"><font color="#ffffff">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>