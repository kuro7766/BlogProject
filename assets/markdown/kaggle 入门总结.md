　　主要是以下几个方面。

　　如何查找一个比较好的baseline？

　　在比赛中的notebook一栏，选择最高获赞的笔记本。这种笔记本通常就是很多人挑选的baseline。通常这种笔记本也有很多人去拷贝。在拷贝数目的旁边可以看到都有谁的笔记本是基于这个笔记本修改的，当然大多数都不公开，基于热门笔记本修改的几百个笔记本里估计只有一两个公开的。

　　如何基于别人的base上修改。

　　拷贝到自己的笔记本之后，就可以在kaggle上修改。

　　代码编辑上如何调试？

　　推荐使用colabcode，使用visual studio code进行调试。

　　在离线这种状态下如何上传自己的需要工具包？

　　首先需要使用pip download下载所需要的工具包，然后在kg笔记本里上传这些包。具体使用的命令如下。

```
!pip download python-box timm pytorch-lightning==1.4.0 grad-cam ttach -d "/pips"
```

```
!pip install --no-index --find-links=file:/pips keras_applications keras_preprocessing
```
```
!pip install --no-index --find-links=file:/pips python-box timm pytorch-lightning==1.4.0 grad-cam ttach
```

　　其中上传的过程比较麻烦，首先需要使用以下命令来创建一个元数据文件。

```
!kaggle datasets init -p  /kgup 
```

　　然后修改元数据文件的ID。

　　之后create就是通过网络上传到kg数据集中。

```
!kaggle datasets create -p /kgup
```

​		已知可以上传的文件，有模型文件。whl文件。

　　其中如果是zip的文件，还有会自动进行递归的解压。这个时候你上传的文件目录可能会发生改变，需要引入后再次进行检查，否则会很长时间找不到问题，我第1次就是这样。


　　kg上的笔记本资源和可运行代码的数量无疑是非常丰富的，如果想要找现场的可运行代码完全可以在这个上面找。

　　最近发现要深入一个领域，只需要找到这些领域的一些词儿，就更容易找到这个领域丰富的资源。这就需要我们多去搜索，多去阅读和发现优质社区。

# colab code

```
# !pip install colabcode
# !ngrok authtoken 20gdfGX9aRMVceOzZobvgf6OJcz_4wtHr4m7itYHTveWRHZFo
# from colabcode import ColabCode
# ColabCode(port=10000, password="abhishek")
```



