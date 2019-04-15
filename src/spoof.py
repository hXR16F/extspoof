# Programmed by hXR16F
# hXR16F.ar@gmail.com

import sys
import os

def reverse_slicing(s):
    return s[::-1]

filename = sys.argv[1]
extension = sys.argv[2]
spoofed_filename = sys.argv[3]
spoofed_extension = sys.argv[4]
dot = sys.argv[5]

os.rename(filename + extension, spoofed_filename + dot + u"\u202E" + reverse_slicing(spoofed_extension) + extension)
print('# Commplete!')
