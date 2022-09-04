import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
   environment = os.environ['ENV']

   print(f"Start listening on port {port}")
   return f'Hello, this is version 1.0\nEnvironment: {environment}\n'

if __name__ == '__main__':
   port = os.environ['PORT']
   app.run(host="0.0.0.0", port=port)
