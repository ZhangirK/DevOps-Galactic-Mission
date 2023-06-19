import http.server
import socketserver

PORT = 80

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b'Greetings from the DevOps Squadron!')

with socketserver.TCPServer(('', PORT), MyHandler) as httpd:
    print(f'Server running on port {PORT}')
    httpd.serve_forever()
