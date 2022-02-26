# tf cuda 对应版本

https://www.tensorflow.org/install/source#gpu

# 检验是否安装成功

https://www.tensorflow.org/guide/gpu

```
import tensorflow as tf
print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
```

# 缺少cudnn64_8.dll

去网上找个这个文件，移动到conda目录下的虚拟环境的根目录中

![](http://kuroweb.tk/picture/16458808642851422.jpg)