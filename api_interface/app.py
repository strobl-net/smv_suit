from flask import Flask

debug = True

app = Flask(__name__, static_folder="static", template_folder="templates")

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=debug, port=8001)