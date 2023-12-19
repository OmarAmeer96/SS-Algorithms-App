import string


def get_dicts():
    d_1 = {key: val for val, key in enumerate(string.ascii_lowercase)}
    d_2 = {key: val for key, val in enumerate(string.ascii_lowercase)}
    return d_1, d_2


def gcd(a, b):
    if b >= a:
        return None
    if b == 0:
        return a
    return gcd(b, a % b)


def mod_inverse(a, n):
    return pow(a, -1, n)


def ceaser_cipher(pt, k):
    d_1, d_2 = get_dicts()
    ct = ''
    pl = pt.split()
    for w in pl:
        for ch in w:
            ct += d_2[(d_1[ch] + k) % 26]
        ct += ' '
    return ct.rstrip()


def ceaser_decipher(ct, k):
    d_1, d_2 = get_dicts()
    pt = ''
    cl = ct.split()
    for w in cl:
        for ch in w:
            pt += d_2[(d_1[ch] - k) % 26]
        pt += ' '

    return pt.rstrip()


def vigenere_cipher(pt: str, k: str):
    d_1, d_2 = get_dicts()
    ct = ""
    pl = pt.split()
    for w in pl:
        if len(w) < len(k):
            return None
        for i in range(len(w)):
            ct += d_2[(d_1[w[i]] + d_1[k[i % len(k)]]) % 26]
        ct += ' '
    return ct.rstrip()


def vigenere_decipher(ct: str, k: str):
    d_1, d_2 = get_dicts()
    pt = ""
    cl = ct.split()
    for w in cl:
        if len(w) < len(k):
            return None
        for i in range(len(w)):
            pt += d_2[(d_1[w[i]] - d_1[k[i % len(k)]]) % 26]
        pt += ' '
    return pt.rstrip()


def autokey_cipher(pt: str, k: str):
    d_1, d_2 = get_dicts()
    ak = k + pt[:-1]
    ct = ''
    for i in range(len(pt)):
        ct += d_2[(d_1[pt[i]] + d_1[ak[i]]) % 26]
    return ct


def autokey_decipher(ct: str, k: str):
    d_1, d_2 = get_dicts()
    ak = k
    pt = ''
    for i in range(len(ct)):
        pt += d_2[(d_1[ct[i]] - d_1[ak[i]]) % 26]
        ak += pt[-1]
    return pt


def affine(pt: str, k: tuple):
    a = k[0]
    b = k[1]
    if gcd(26, a) != 1:
        return None
    d_1, d_2 = get_dicts()
    ct = ''
    for ch in pt:
        ct += d_2[((d_1[ch] * a) + b) % 26]
    return ct


def affine_decipher(ct: str, k: tuple):
    a = k[0]
    b = k[1]
    if gcd(26, a) != 1:
        return None
    d_1, d_2 = get_dicts()
    pt = ''
    for ch in ct:
        pt += d_2[mod_inverse(a, 26) * (d_1[ch] - b) % 26]
    return pt
