from flask import Flask, request, jsonify
from configparser import ConfigParser
import logging
import os


dir_path = os.path.dirname(os.path.realpath(__file__))
config = ConfigParser()
config.read(f'{dir_path}/dummy.cfg')

logging.basicConfig(
    filename=config['LOGGING']['log_file'],
    level=config['LOGGING']['log_level'])

app = Flask(__name__)


@app.route('/dummy', methods=['GET'])
def dummy():
    firstname = request.args.get("firstname")
    lastname = request.args.get("lastname")
    logging.info(f"{firstname} {lastname}")
    return f"{firstname} {lastname}"


if __name__ == "__main__":
    app.run(host=config['APISERVER']['api_host'],
            port=config['APISERVER']['api_port'])
