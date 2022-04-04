众所周知，很多的编程工具包都在国外。目前大部分人也都会科学上网，但是有一个问题，win
的cmd不支持走酸酸乳的代理，在这之前，我搜过很多设置http_proxy和https_proxy的文章，clone github仍然不行

为了解决这个问题，可以使用下面这个工具

https://github.com/shunf4/proxychains-windows

一个比github更简单的傻瓜式步骤：


1.


在
https://github.com/shunf4/proxychains-windows/blob/master/proxychains.conf 的基础上添加这行代码

[ProxyList]
socks5 localhost 10808

10808是sock5的端口，这个端口同时也可以给局域网用

2.

新建一个文件，命名为proxy.bat，内容如下
```
D:\proxychains\proxychains_win32_x64.exe -f D:\proxychains\proxychains.conf %*
```

3.

把proxy.bat放到环境变量中

4. 使用方法

proxy.bat pip install -r requirements.txt

之后就会默认走代理了

