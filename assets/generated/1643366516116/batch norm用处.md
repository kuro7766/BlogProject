# Batch norm 和 Layer Norm
[文章地址](http://proceedings.mlr.press/v37/ioffe15.html)

# how to do

- performing the normalization for each training mini-batch

文中虽然提到将来会对rnn 进行测验，但是效果并不好。容易发生梯度消失的问题。

# why && 优点

![](http://kuroweb.tk/picture/16433587548600172.jpg)
对于 sigmoid图像来说，如果不进行normalize，中间导数较大，靠近两边时导数很小，导致训练变慢

这样一来就可以在更短的迭代周期内获得更好的训练效果。


BN 缺点：

1.需要较大的batch以体现整体数据分布

2.训练阶段需要保存每个batch的均值和方差，以求出整体均值和方差在infrence阶段使用

3.不适用于可变长序列的训练，如RNN

# Layer Norm
[paper](http://arxiv.org/abs/1607.06450)

LayerNorm归一化之后的缩放是特征维度上做的

## 优点

- 适用于rnn
- 对batch没有要求，1也可以

> Unlike batch normalization,
layer normaliztion does not impose any constraint on the size of a mini-batch and it can be used in
the pure online regime with batch size 1
