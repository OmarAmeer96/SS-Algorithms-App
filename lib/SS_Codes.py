import string


def get_dicts():
    letter_to_index = {key: val for val, key in enumerate(string.ascii_lowercase)}  # (0, 'a')
    index_to_letter = {key: val for key, val in enumerate(string.ascii_lowercase)}  # ('a', 0)
    return letter_to_index, index_to_letter


def gcd(a: int, b: int):
    if b > a:
        return gcd(b, a)
    if b == 0:
        return a
    return gcd(b, a % b)


def mod_inverse(a: int, n: int):
    return pow(a, -1, n)


def ceaser_cipher(pt: str, k: int):
    letter_to_index, index_to_letter = get_dicts()
    ct = ''
    pl = pt.split()
    for w in pl:
        for ch in w:
            ct += index_to_letter[(letter_to_index[ch] + k) % 26]
        ct += ' '
    return ct.rstrip()


def ceaser_decipher(ct: str, k: int):
    letter_to_index, index_to_letter = get_dicts()
    pt = ''
    cl = ct.split()
    for w in cl:
        for ch in w:
            pt += index_to_letter[(letter_to_index[ch] - k) % 26]
        pt += ' '

    return pt.rstrip()


def vigenere_cipher(pt: str, k: str):
    letter_to_index, index_to_letter = get_dicts()
    ct = ""
    pl = pt.split()
    for w in pl:
        if len(w) < len(k):
            return None
        for i in range(len(w)):
            ct += index_to_letter[(letter_to_index[w[i]] + letter_to_index[k[i % len(k)]]) % 26]
        ct += ' '
    return ct.rstrip()


def vigenere_decipher(ct: str, k: str):
    letter_to_index, index_to_letter = get_dicts()
    pt = ""
    cl = ct.split()
    for w in cl:
        if len(w) < len(k):
            return None
        for i in range(len(w)):
            pt += index_to_letter[(letter_to_index[w[i]] - letter_to_index[k[i % len(k)]]) % 26]
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
    letter_to_index, index_to_letter = get_dicts()
    ct = ''
    pl = pt.split()
    for w in pl:
        for ch in w:
            ct += index_to_letter[((a * letter_to_index[ch]) + b) % 26]
        ct += ' '
    return ct.rstrip()


def affine_decipher(ct: str, k: tuple):
    a = k[0]
    b = k[1]
    if gcd(26, a) != 1:
        return None
    letter_to_index, index_to_letter = get_dicts()
    pt = ''
    cl = ct.split()
    for w in cl:
        for ch in w:
            pt += index_to_letter[(mod_inverse(a, 26) * (letter_to_index[ch] - b)) % 26]
        pt += ' '
    return pt.rstrip()


t = "war is war"
c = affine(t, (7, 10))
p = affine_decipher(c, (7, 10))
print(c)
print(p)
