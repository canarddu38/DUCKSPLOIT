import http.server
import os
import sys

os.chdir('C:\$DuckSploitw\pannel')

if __name__ == "__main__":

    sys.stdout = sys.stderr = open(os.devnull, "w")

    httpd = http.server.HTTPServer(("", 8013), http.server.SimpleHTTPRequestHandler)
    httpd.serve_forever()