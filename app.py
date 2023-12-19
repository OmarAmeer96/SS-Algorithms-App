from flask import Flask, request, jsonify
from libraries import *

app = Flask(__name__)


@app.route('/', methods=['GET'])
def hello_world():
    json_file = {'query': 'Hala Walla'}
    return jsonify(json_file)


@app.route('/hello', methods=['POST'])
def hello_world_2():
    data = request.get_json()
    name = data.get('name', '')
    print(f"Hello, {name}")
    return jsonify({'message': f"Hello, {name}"}), 200


@app.route('/caesarEncryption', methods=['POST'])
def caesar_encryption():
    data = request.get_json()
    pt = data.get('pt')
    k = int(data.get('k'))
    message = ceaser_cipher(pt, k)
    return jsonify({'message': message}), 200


@app.route('/caesarDecryption', methods=['POST'])
def caesar_decryption():
    data = request.get_json()
    ct = data.get('ct')
    k = int(data.get('k'))
    message = ceaser_decipher(ct, k)
    return jsonify({'message': message}), 200


@app.route('/vigenereEncryption', methods=['POST'])
def vigenere_encryption():
    data = request.get_json()
    pt = data.get('pt')
    k = data.get('k')
    message = vigenere_cipher(pt, k)
    return jsonify({'message': message}), 200


@app.route('/vigenereDecryption', methods=['POST'])
def vigenere_decryption():
    data = request.get_json()
    ct = data.get('ct')
    k = data.get('k')
    message = vigenere_decipher(ct, k)
    return jsonify({'message': message}), 200


@app.route('/autokeyEncryption', methods=['POST'])
def autokey_encryption():
    data = request.get_json()
    pt = data.get('pt')
    k = data.get('k')
    message = autokey_cipher(pt, k)
    return jsonify({'message': message}), 200


@app.route('/autokeyDecryption', methods=['POST'])
def autokey_decryption():
    data = request.get_json()
    ct = data.get('ct')
    k = data.get('k')
    message = autokey_decipher(ct, k)
    return jsonify({'message': message}), 200


@app.route('/affineEncryption', methods=['POST'])
def affine_encryption():
    data = request.get_json()
    pt = data.get('pt')
    k1 = int(data.get('k1'))
    k2 = int(data.get('k2'))
    message = affine(pt, (k1, k2))
    return jsonify({'message': message}), 200


@app.route('/affineDecryption', methods=['POST'])
def affine_decryption():
    data = request.get_json()
    ct = data.get('ct')
    k1 = int(data.get('k1'))
    k2 = int(data.get('k2'))
    message = affine_decipher(ct, (k1, k2))
    return jsonify({'message': message}), 200


if __name__ == '__main__':
    app.run(
        debug=True,
        host='192.168.1.6'
    )
