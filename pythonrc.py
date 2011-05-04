# Get this config using PYTHONSTARTUP variable

import sys, os, string, time

try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    try:
        import rlcompleter
        readline.parse_and_bind("tab: complete")
    except ImportError:
        print("Module rlcompleter not available")

h = [None]

class Prompt:
    "Create a prompt that stores results (i.e. _) in the array h."
    def __init__(self, str='h[%d] >>> '):
        self.str = str;

    def __str__(self):
        try:
            if _ not in [h[-1], None, h]: h.append(_);
        except NameError:
            pass
        return self.str % len(h);

    def __radd__(self, other):
        return str(other) + str(self)

sys.ps1 = Prompt()
