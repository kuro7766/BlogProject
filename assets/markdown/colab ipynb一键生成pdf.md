# colab ipynb一键生成pdf

把以下代码输入单元格里，并输入当前文件名称 current_notebook_name，运行即可在content/ 目录下找到pdf文件

```python
# 目前需要手动输入
current_notebook_name=''

assert current_notebook_name,f'current_notebook_name must not be null'

# Install the PyDrive wrapper & import libraries.
!pip install -U -q PyDrive
from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive
from google.colab import auth
from oauth2client.client import GoogleCredentials

!apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic

# Authenticate and create the PyDrive client.
auth.authenticate_user()
gauth = GoogleAuth()
gauth.credentials = GoogleCredentials.get_application_default()
drive = GoogleDrive(gauth)

# Copy/download the file
fid = drive.ListFile({'q':f"title='{current_notebook_name}'"}).GetList()[0]['id']
f = drive.CreateFile({'id': fid})
f.GetContentFile('notebook.ipynb')

!jupyter nbconvert notebook.ipynb --to pdf
# pdf文件会生成在 content/ 目录下
```

