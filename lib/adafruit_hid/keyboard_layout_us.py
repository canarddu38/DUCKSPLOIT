# SPDX-FileCopyrightText: 2017 Dan Halbert for Adafruit Industries
#
# SPDX-License-Identifier: MIT

"""
`adafruit_hid.keyboard_layout_us.KeyboardLayoutUS`
=======================================================

* Author(s): Dan Halbert
"""

from .keyboard_layout_base import KeyboardLayoutBase


class KeyboardLayoutUS(KeyboardLayoutBase):
    """Map ASCII characters to appropriate keypresses on a standard US PC keyboard.

    Non-ASCII characters and most control characters will raise an exception.
    """

    # The ASCII_TO_KEYCODE bytes object is used as a table to maps ASCII 0-127
    # to the corresponding # keycode on a US 104-key keyboard.
    # The user should not normally need to use this table,
    # but it is not marked as private.
    #
    # Because the table only goes to 127, we use the top bit of each byte (ox80) to indicate
    # that the shift key should be pressed. So any values 0x{8,9,a,b}* are shifted characters.
    #
    # The Python compiler will concatenate all these bytes literals into a single bytes object.
    # Micropython/CircuitPython will store the resulting bytes constant in flash memory
    # if it's in a .mpy file, so it doesn't use up valuable RAM.
    #
    # \x00 entries have no keyboard key and so won't be sent.
    ASCII_TO_KEYCODE = (
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x2a'  # BACKSPACE
        b'\x2b'  # '\t'
        b'\x28'  # '\n'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x29'  # ESC
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x00'
        b'\x2c'  # ' '
        b'\x38'  # '!'
        b'\x20'  # '"'
        b'\x20'  # '#'
        b'\x30'  # '$'
        b'\xb4'  # '%'
        b'\x1e'  # '&'
        b'\x21'  # "'"
        b'\x22'  # '('
        b'\x2d'  # ')'
        b'\x31'  # '*'
        b'\xae'  # '+'
        b'\x10'  # ','
        b'\x23'  # '-'
        b'\xb6'  # '.'
        b'\xb7'  # '/'
        b'\xa7'  # '0'
        b'\x9e'  # '1'
        b'\x9f'  # '2'
        b'\xa0'  # '3'
        b'\xa1'  # '4'
        b'\xa2'  # '5'
        b'\xa3'  # '6'
        b'\xa4'  # '7'
        b'\xa5'  # '8'
        b'\xa6'  # '9'
        b'\x37'  # ':'
        b'\x36'  # ';'
        b'\x64'  # '<'
        b'\x2e'  # '='
        b'\xe4'  # '>'
        b'\x90'  # '?'
        b'\x27'  # '@'
        b'\x94'  # 'A'
        b'\x85'  # 'B'
        b'\x86'  # 'C'
        b'\x87'  # 'D'
        b'\x88'  # 'E'
        b'\x89'  # 'F'
        b'\x8a'  # 'G'
        b'\x8b'  # 'H'
        b'\x8c'  # 'I'
        b'\x8d'  # 'J'
        b'\x8e'  # 'K'
        b'\x8f'  # 'L'
        b'\xb3'  # 'M'
        b'\x91'  # 'N'
        b'\x92'  # 'O'
        b'\x93'  # 'P'
        b'\x84'  # 'Q'
        b'\x95'  # 'R'
        b'\x96'  # 'S'
        b'\x97'  # 'T'
        b'\x98'  # 'U'
        b'\x99'  # 'V'
        b'\x9d'  # 'W'
        b'\x9b'  # 'X'
        b'\x9c'  # 'Y'
        b'\x9a'  # 'Z'
        b'\x22'  # '['
        b'\x25'  # '\\'
        b'\x2d'  # ']'
        b'\x26'  # '^'
        b'\x25'  # '_'
        b'\x00'  # '`' (Dead key)
        b'\x14'  # 'a'
        b'\x05'  # 'b'
        b'\x06'  # 'c'
        b'\x07'  # 'd'
        b'\x08'  # 'e'
        b'\x09'  # 'f'
        b'\x0a'  # 'g'
        b'\x0b'  # 'h'
        b'\x0c'  # 'i'
        b'\x0d'  # 'j'
        b'\x0e'  # 'k'
        b'\x0f'  # 'l'
        b'\x33'  # 'm'
        b'\x11'  # 'n'
        b'\x12'  # 'o'
        b'\x13'  # 'p'
        b'\x04'  # 'q'
        b'\x15'  # 'r'
        b'\x16'  # 's'
        b'\x17'  # 't'
        b'\x18'  # 'u'
        b'\x19'  # 'v'
        b'\x1d'  # 'w'
        b'\x1b'  # 'x'
        b'\x1c'  # 'y'
        b'\x1a'  # 'z'
        b'\x21'  # '{'
        b'\x23'  # '|'
        b'\x2e'  # '}'
        b'\x00'  # '~' (Dead key)
        b'\x00'
    )

KeyboardLayout = KeyboardLayoutUS
