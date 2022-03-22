传统 weak:
无法关注局部信息
空间复杂度2次方增长

本文的方法

$O(L(log L)^2)$

传统曲线 State Space Models (SSMs) and Autoregressive (AR) models。他们的缺点: manually selecting trend, seasonality and other components 导致可用性低。

lstm长距离依赖的效果也很差的一个实验：

200 tokens on average but are
only able to sharply distinguish 50 tokens nearby, indicating that even LSTM struggles to capture
long-term dependencies

相比之下，transformers的优点：

 Transformer allows the
model to access any part of the history regardless of distance

然而，他的缺点也存在：

canonical dot-product
self-attention matches queries against keys insensitive to **local context**, 也就是对局部的关注能力不够。


另外它的时间复杂度也是一个问题，无法对长距离的时间序列进行细粒度预测。

本文的贡献：

我们把transformer用在时间序列预测上

我们提出了一种卷机自注意力的方式来获取查询和键值。这样的query，key可以感受到局部的上下文，例如形状。从而提高精度，降低loss。

　　我们降低了时间复杂度，从而对长序列使用这个方法更加的可行。

