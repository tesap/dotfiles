import math, os, string

class BytesData:
    bytes_arr = ''
    def __init__(self, hex_string: str):
        pass

    def from_bytes(self, b):
        self.bytes_arr = b

    def from_hex(self, h):
        self.bytes_arr = hex_to_bytes(h)

    def from_bin(self, b):
        self.bytes_arr = bin_to_bytes(b)

    def from_int(self, n):
        self.bytes_arr = int_to_bytes(n)

    def to_bytes(self):
        return self.bytes_arr 

    def to_int(self):
        return bytes_to_int(self.bytes_arr)

    def to_hex(self):
        return bytes_to_hex(self.bytes_arr)

    def to_bin(self):
        return bytes_to_bin(self.bytes_arr)


BLOCK_SIZE = 8

# ---- Utils funcs ----

def bin_to_arr(s, block_size=BLOCK_SIZE):
    def split_by(s, step):
        return [s[i:i + step] for i in range(0, len(s), step)]

    def fill_zeros(s, x):
        def nearest_bigger(n, x):
            return math.ceil(n / x) * x
            # return n - (n % x) + x

        zero_pad = nearest_bigger(len(s), x)
        return s.zfill(zero_pad)

    res = fill_zeros(s, block_size)
    res = split_by(res, block_size)

    return res

# ---- Main funcs ----

def hex_to_bytes(s):
    # return s.decode('hex').encode()
    # return binascii.unhexlify(s)
    return bytes.fromhex(s)

def bytes_to_hex(b):
    # return binascii.hexlify(b)

    def strip_zeros(s):
        i = 0
        while i <= len(s):
            if s[i] == '0':
                i += 1
            else:
                break

        return s[i:]

    if not isinstance(b, bytes):
        raise Exception(f'{b} is not bytes')

    return strip_zeros(b.hex())

def hex_to_int(h):
    return int(h, 16)

def int_to_bin(n):
    return bin(n)[2:]

def bin_to_int(b):
    return int(b, 2)

def bin_to_bytes(x):
    def bin_arr_to_bytes(arr):
        for i in arr:
            yield bin_to_int(i)
    # import pdb;pdb.set_trace()

    res = bin_to_arr(x) if isinstance(x, str) else x

    return bytes(bin_arr_to_bytes(res))

def int_to_bytes(n):
    return bin_to_bytes(int_to_bin(n))

def int_to_hex(n):
    return bytes_to_hex(int_to_bytes(n))

def bytes_to_int(b):
    return hex_to_int(bytes_to_hex(b))

def hex_to_bin(h):
    return int_to_bin(hex_to_int(h))

def bytes_to_bin(b):
    return hex_to_bin(bytes_to_hex(b))

def hex_to_bytes(h):
    return bin_to_bytes(hex_to_bin(h))

def bin_to_hex(b):
    return bytes_to_hex(bin_to_bytes(b))

# ---- ----

def random_bin(n):
    # import pdb;pdb.set_trace()
    bytes_count = n // 8 + 1

    bytes_arr = os.urandom(bytes_count)
    binary_string = bytes_to_bin(bytes_arr)

    length = len(binary_string)

    if length < n:
        raise Exception(f'{length} < {n}')

    diff_len = length - n
    binary_string = binary_string[diff_len:]

    return binary_string

def random_bytes(n):
    return bin_to_bytes(random_bin(n * 8))
