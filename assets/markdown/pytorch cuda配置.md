本文主要记录一些，pytorch在安装和训练方面的一些环境配置操作。

# pytorch

安装的时候需要安装三个东西，一个是官网上的包，一个是cudatoolkit(这个应该也在pt官网上)，一个是cuda(这个东西在conda外部安装了好像不起作用)

# PyTorch v1 Stable

- 下载历史版本，见底部参考

- 查看windows cuda版本
  [如何查看windows的CUDA版本_天泪哈哈的博客-CSDN博客_查看cuda版本](https://blog.csdn.net/qq_38295511/article/details/89223169)

# torch卸载

# 检查是否安装成功

torch.cuda.is_available()

查看返回值是否为真

# 我的电脑上的可用版本
在下面这个链接中选择一个conda tk=10.2的版本，然后直接安装

[Previous PyTorch Versions | PyTorch](https://pytorch.org/get-started/previous-versions/)



# 分布式训练
## docker 虚拟gpu集群
https://blog.csdn.net/mogoweb/article/details/80633235?utm_medium=distribute.wap_aggpage_search_result.none-task-blog-2~aggregatepage~first_rank_ecpm_v1~rank_v31_ecpm-2-80633235.wap_agg_so&utm_term=dockergpu
# 查看conda python环境是否生效

打开我们的cmd命令

输入Python

输入 import sys

输入 print(sys.path)

或者使用pip --version查看打印出的路径是什么

# 参考

[Previous PyTorch Versions | PyTorch](https://pytorch.org/get-started/previous-versions/)


[pytorch分布式](https://www.cnblogs.com/rossiXYZ/p/15664335.html)




































































