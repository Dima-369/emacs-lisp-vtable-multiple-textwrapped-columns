import textwrap
import sys


def wrap_text(string, column_length):
    lines = string.split("\n")
    lines = [textwrap.fill(line, column_length) for line in lines]
    result = "\n".join(lines)
    return result


print(wrap_text(sys.argv[1], int(sys.argv[2])))
