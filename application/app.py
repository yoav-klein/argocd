import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
   version = os.environ['VERSION']
   
   return f'Hello, this is version {version}'

if __name__ == '__main__':
   app.run(host="0.0.0.0")
