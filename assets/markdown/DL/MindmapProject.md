# word2vec部分

## gensim工具

[Word2vec sentence的含义](https://stackoverflow.com/questions/45420466/gensim-keyerror-word-not-in-vocabulary)

[github上面一个比较详细的代码说明，包括加载，文件处理](https://github.com/PanJinquan/nlp-learning-tutorials/blob/b5c3c5b8a507e853c753a389cad0b8215e87b26e/word2vec/word2vec_gensim.py#L46)

- min_count参数

    Words below the min_count frequency are dropped before training occurs.


# gnn

## DGL

### requirements:
```pytorch<=1.9```

暂时不用

# 转tflite的工具

https://github.com/huggingface/tflite-android-transformers/blob/master/models_generation/distilbert.py

其中绝大部分的bert，transformer模型都可以去hf上面找到，然后再用这个转换工具部署到手机和网页上。注意输入输出形状要相同。



[sentence transformer](https://www.sbert.net/)


其中 https://github.com/JohnGiorgi/DeCLUTR , 可以实现一个简单的无监督模型编码。目前暂时考虑把模型加载和编码放在浏览器上运行。在百度脑图的后端部分，只保存一些向量数据。训练不在后端上运行，所有的语料库拉取之后，在web上训练模型。

另一种方案就是不再进行训练，只用于训练的对句子进行，这样一来的工作量只是把模型部署到web端，牺牲了领域知识，但是理论上对搜索结果不会很有大的影响。