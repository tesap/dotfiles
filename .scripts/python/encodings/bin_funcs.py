import functools
import math
import os


class BytesData:
    __bytes_arr = bytes()

    def __init__(self, b: bytes):
        self.__bytes_arr = b

    @classmethod
    def from_bytes(cls, b: bytes):
        return cls(b)

    @classmethod
    def from_hex(cls, h: str):
        b = hex_to_bytes(h)
        return cls(b)

    @classmethod
    def from_bin(cls, bin_str: str):
        raise NotImplementedError

    @classmethod
    def from_int(cls, n: int):
        b = int_to_bytes(n)
        return cls(b)

    def to_bytes(self) -> bytes:
        return self.__bytes_arr

    def to_hex(self) -> str:
        h = bytes_to_hex(self.__bytes_arr)
        return h

    def to_bin(self) -> str:
        raise NotImplementedError
        # bin_str = bytes_to_bin(self.__bytes_arr)
        # return bin_str

    def to_int(self) -> int:
        n = bytes_to_int(self.__bytes_arr)
        return n


class HexData:
    __hex_str = ''

    def __init__(self, hex_str: str):
        if len(hex_str) % 2 != 0:
            raise Exception

        self.__hex_str = hex_str

    @classmethod
    def from_hex(cls, hex_str: str):
        return cls(hex_str)

    @classmethod
    def from_bytes(cls, b: bytes):
        return cls(
            bytes_to_hex(b)
        )

    @classmethod
    def from_bin(cls, b: str):
        return cls(
            bin_to_hex(b)
        )

    @classmethod
    def from_int(cls, n: int):
        return cls(
            int_to_hex(n)
        )

    def to_bytes(self) -> bytes:
        return hex_to_bytes(self.__hex_str)

    def to_int(self) -> int:
        return hex_to_int(self.__hex_str)

    def to_hex(self) -> str:
        return self.__hex_str

    def to_bin(self) -> str:
        return hex_to_bin(self.__hex_str)

    def __str__(self):
        return self.to_hex()

    def __repr__(self):
        return self.__str__()


BLOCK_SIZE = 8


# ---- Utils funcs ----

def nearest_bigger(n, x):
    return math.ceil(n / x) * x
    # return n - (n % x) + x


def generator_to_list(func):
    @functools.wraps
    def inner(*args, **kwargs):
        return func(*args, **kwargs)

    return inner


# ---- Main funcs ----

def split_to_chunks(s, block_size=BLOCK_SIZE, fill_marginal_chunk=False, is_fill_marginal_left=True) -> list:
    """
    split given string to chunks of block_size, additionally filling with zeros to right of left
    :param s: input string
    :param block_size: chunk size
    :param fill_marginal_chunk: whether to fill with zeros
    :param is_fill_marginal_left: on which side to fill
    :return: list of chunks as strings
    """

    def split_by(s, step) -> list:
        return [s[i:i + step] for i in range(0, len(s), step)]

    def fill_zeros(s, x, to_left=True) -> str:
        zero_pad = nearest_bigger(len(s), x)

        if to_left:
            return s.zfill(zero_pad)
        else:
            return s[::-1].zfill(zero_pad)[::-1]

    if fill_marginal_chunk:
        s = fill_zeros(
            s,
            block_size,
            to_left=is_fill_marginal_left
        )

    chunks_arr = split_to_chunks(s, block_size)
    return chunks_arr


def bytes_to_hex(b: bytes) -> str:
    # return binascii.hexlify(b)
    return b.hex()


def hex_to_int(h: str) -> int:
    return int(h, 16)  # zeros are filled to left automatically


def int_to_bin(n: int, to_bytes_size=True):
    """
    zeros are added to the left
    """
    res = bin(n)[2:]

    if to_bytes_size:
        to_add_cnt = 8 - (len(res) % 8)
        if to_add_cnt == 8:
            to_add_cnt = 0

        res = to_add_cnt * "0" + res

    return res


def bin_to_int(b: str) -> int:
    return int(b, 2)


def bin_to_bytes(s: str, fill_bin_to_left=True) -> bytes:
    def bin_arr_to_bytes(arr) -> [int]:
        for i in arr:
            yield bin_to_int(i)

    res = split_to_chunks(
        s,
        is_fill_marginal_left=fill_bin_to_left
    ) if isinstance(s, str) else s

    return bytes(
        bin_arr_to_bytes(res)
    )


def int_to_bytes(n: int) -> bytes:
    return bin_to_bytes(
        int_to_bin(n),  # already filled on left
        fill_bin_to_left=True
    )


def int_to_hex(n: int) -> str:
    return bytes_to_hex(int_to_bytes(n))


# def hex_to_bin(h: str) -> str:
#     return bytes_to_bin(hex_to_bytes(h))
#     return int_to_bin(  # zeros filled to left
#         hex_to_int(h)
#     )


# def bytes_to_bin(b: bytes) -> str:
#     return hex_to_bin(bytes_to_hex(b))


def bytes_to_int(b: bytes) -> int:
    return hex_to_int(
        bytes_to_hex(b)
    )


def hex_to_bytes(hex_str: str) -> bytes:
    if len(hex_str) % 2 != 0:
        raise Exception

    @generator_to_list
    def my_func(hex_str_: str):
        hex_chunks: list[str] = split_to_chunks(
            hex_str_,
            block_size=2,
            fill_marginal_chunk=False
        )

        for i in hex_chunks:
            b = bytes.fromhex(i)
            yield b

    # return my_func(hex_str)
    # return binascii.unhexlify(hex_str)
    return bytes.fromhex(hex_str)


def bin_to_hex(b: str) -> str:
    if len(b) % 8 != 0:
        raise Exception

    return bytes_to_hex(bin_to_bytes(b))


# ---- ----

def random_bytes(n: int) -> bytes:
    """
    :param n: length (in bytes)
    :return: bytes array
    """
    res = os.urandom(n)

    assert len(res) == n
    return res


def random_bin(bytes_n: int) -> str:
    """
    Generates a random sequence of 0 and 1, stripped to given length (in bytes)
    :param bytes_n: bytes count
    :return: string of zeros and ones
    """

    rand_bytes = random_bytes(bytes_n)

    hd = HexData.from_bytes(rand_bytes)
    bin_string = hd.to_bin()

    assert len(bin_string) == bytes_n * 8
    return bin_string


if __name__ == "__main__":
    while True:
        print(random_bin(bytes_n=10))
