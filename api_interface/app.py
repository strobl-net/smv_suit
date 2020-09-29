from flask import Flask, render_template
from flask_bootstrap import Bootstrap

from api_interface.routes.organisation import organisation_pages
from api_interface.routes.person import person_pages

debug = True
app = Flask(__name__)
app.jinja_env.cache = {}
app.config['SECRET_KEY'] = 'VERY SECURE KEY XD'

app.register_blueprint(person_pages)
app.register_blueprint(organisation_pages)

bootstrap = Bootstrap(app)


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/api")
def api():
    return render_template('api.html')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=debug, port=8001)
