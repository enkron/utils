#!/usr/bin/env python3

import hashlib
import sys


def hash_file(filename):
    '''Return SHA-1 hash of some file.'''
    h = hashlib.sha1() #make a hash object
    with open(filename, 'rb') as file: # read file in binary mode
        chunk = 0
        while chunk != b'':
            chunk = file.read(1024) #read only 1024 bytes at a time
            h.update(chunk)
    return h.hexdigest() #hex representation of digest

message = hash_file(sys.argv[1])
print(message)
print(sys.argv[1])

