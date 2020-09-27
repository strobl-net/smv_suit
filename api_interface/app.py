from flask import Flask, render_template

debug = True

app = Flask(__name__)


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/api")
def api():
    return render_template('api.html')


@app.route("/api/persons")
def persons():
    return render_template('models/person.html')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=debug, port=8001)