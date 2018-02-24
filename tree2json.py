#!/usr/bin/env python

import os
import errno

def path_hierarchy(path):

    hierarchy = {
        'type': 'folder',
        'name': os.path.basename(path),
        'path': path,
    }
#    if os.path.basename(path).startswith( '.' ) == True:
#        return False

    if path.startswith( '/root/.' ) == True:
        return False

    if os.path.basename(path) == "node_modules":
        hierarchy['type'] = 'hidden'
        return hierarchy

    try:
        hierarchy['children'] = [
            path_hierarchy(os.path.join(path, contents))
            for contents in os.listdir(path)
        ]
    except OSError as e:
        if e.errno != errno.ENOTDIR:
            raise
        hierarchy['type'] = 'file'

    return hierarchy

if __name__ == '__main__':
    import json
    import sys

    try:
        directory = sys.argv[1]
    except IndexError:
        directory = "/root"

    print(json.dumps(path_hierarchy(directory), indent=2, sort_keys=True))
