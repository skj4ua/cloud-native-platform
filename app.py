from flask import Flask
import logging

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

@app.route("/")
def home():
    app.logger.info("Home endpoint hit")
    return "Hello from DevOps Platform"

@app.route("/health")
def health():
    return "OK"

app.run(host="0.0.0.0", port=3000)
