package org.grails.plugins.helpballoons
class HelpBalloonTagLib {

    private static final Object lockable = new Object();
    private static long count = 0L;

    def helpBalloonService

    def helpBalloons = {attrs, body ->
        def icon = attrs["icon"] ?: g.helpBalloonsResource(dir: "images", file: "balloon-icon.gif")
        def button = attrs["button"] ?: g.helpBalloonsResource(dir: "images", file: "balloon-button.png")
        def prefix = attrs["balloonPrefix"] ?: g.helpBalloonsResource(dir: "images") + "/balloon-"
        def base = attrs["base"] ?: g.helpBalloonsResource(dir: "js") + "/"

        out << g.javascript(library: "prototype", base: base)
        out << """<script type="text/javascript" src="${g.helpBalloonsResource(dir: "js", file: "HelpBalloon.js")}"></script>\n"""
        out << """<script type="text/javascript">
  HelpBalloon.Options.prototype = Object.extend(HelpBalloon.Options.prototype, {
    icon: '$icon',
    button: '$button',
    balloonPrefix: '$prefix'
  });
</script>
"""
    }

    def helpBalloon = {attrs, body ->
        def title = attrs["title"]
        def content = attrs["content"]
        def code = attrs["code"]
        def suffix = attrs["suffix"] ?: ".help"
        def encodeAs = attrs["encodeAs"]

        if (!title && code) title = g.message(code: code)
        if (!content && code) content = g.message(code: code + suffix)

        title = title ?: ""
        content = content ?: ""

        if (encodeAs) {
            switch (encodeAs.toUpperCase()) {

                case "HTML":
                    title = title.encodeAsHTML()
                    content = content.encodeAsHTML()
                    break

                case "XML":
                    title = title.encodeAsXML()
                    content = content.encodeAsXML()
                    break
            }
        }

        def num
        synchronized (lockable) {
            num = count++;
        }
        out << """<script type="text/javascript">
  var hb$num = new HelpBalloon({
    title: '${title.encodeAsJavaScript()}',
    content: '${content.encodeAsJavaScript()}'
  });
</script>
"""
    }

    def helpBalloonsResource = {attrs, body ->
        def uri = grailsAttributes.getApplicationUri(request)
        if (attrs.dir) uri = uri + '/' + attrs.dir
        if (attrs.file) uri = uri + '/' + attrs.file
        out << uri
    }
}
