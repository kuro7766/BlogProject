conda install anaconda Memory Error报错

CondaMemoryError: The conda process ran out of memory. Increase system memory and/or try again4

这是一个奇怪的问题，如果直接创建了一个conda环境之后，直接运行安装anaconda，会占用非常大量的内存。
原因可能在于
https://conda.anaconda.org/conda-forge/win-64/repodata.json
这个文件包含的对象太多，遍历的复杂度过大，最后的解决办法是。先安装一些大型软件，例如torch环境，然后再运行这个命令，可以减小对内存的依赖





