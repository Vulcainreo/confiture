#!/bin/python3
import os
import yaml
import hashlib
import sys

filename = str(sys.argv[1])
print("Working on "+filename)

nbDevices = 1

yamlFile = open(filename, 'r')
yamlContent = yaml.safe_load(yamlFile)

htmlHeader =   """
                <!DOCTYPE html>
                <meta charset="utf-8">
                <head>
                    <title>Test conf</title>
                    <script src="/jquery.js" type="text/javascript"/></script>
                </head>
                <body>
                <a class="simple">Download Multi-line Text File (Blob)</a>
                <button class="save-file">Save File</button>

                <br/>
                    <button class="save">Save</button>
                    <input type="button" onClick="load();" value="Load"/>
                    <input type=text" value="./confaaa.text"/>
                """

htmlFooter = """
                <script src="/actions.js" type="text/javascript"/></script>
                </body></html>
             """

content = """
         <table class="table">
          <thead>
            <tr>
         """

              # <th scope="col">#</th>

content += """              <th scope="col">Catégorie</th>
              <th scope="col">Point de contrôle</th>
              <th scope="col">Commande</th>
        """

# for i in range(nbDevices):
#     content += """<th scope="col">Analysis """+str(i)+"""</th>"""

content += """
            </tr>
          </thead>
          <tbody>
          """
for tests in yamlContent["tests"]:
    # content += "<tr class=\"controlCheck\"><th scope=\"row\"><span class=\"idControlCheck\">"+hashlib.md5(str(tests["category"] + tests["control"]).encode('utf-8')).hexdigest()+"</span></th>"
    content += "<td>"+tests["category"]+"</td>"
    content += "<td>"+tests["control"]+"</td>"
    content += "<td>"+tests["command"]+"</td>"

    # for i in range(nbDevices):
        # content += "<td><textarea class=\"analysis\"></textarea></td>"

    content += "</tr>"

content += "</tbody></table>"

outputFile = open("./generated/output.html", 'w')
outputFile.write(htmlHeader + content + htmlFooter)
outputFile.close()

print(filename+" processed to ./generated/output.html")
