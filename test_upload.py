import requests
import os, shutil

import sys


def make_archive(source, destination):
    base = os.path.basename(destination)
    name = base.split('.')[0]
    format = base.split('.')[1]
    archive_from = os.path.dirname(source)
    archive_to = os.path.basename(source.strip(os.sep))
    shutil.make_archive(name, format, archive_from, archive_to)
    shutil.move('%s.%s' % (name, format), destination)


if __name__ == '__main__':
    project_name = 'blog'
    project_dir = 'build/web'
    make_archive(os.path.join(os.getcwd(), project_dir),
                 'default.zip')
    files = {'file': open('default.zip', 'rb')}
    values = {}
    r = requests.post('http://kuroweb.cf:8083/upload?app=' + f'{project_name}&token={sys.argv[1]}', files=files,
                      data=values)
    exit(r.text)
