- 对称矩阵
    B==B.T，返回的是和矩阵形状一样的shape
- A.clone()
    把内存重新分配

- 点乘

    torch.sum(A*B)等价于 torch.dot(A,B)

- mv,mm
    matrix-vector
    matrix-matrix
    torch.mm(A,B)
    torch.mv(A,x)

- with torch.no_grad()
    
    在计算中不计算梯度 
    这里的用意大概就是，作者建立了一些变量，尤其是数组，他只是想要一些类似 Numpy的一些功能，而不是计算梯度。

- @wraps

    可以实现函数的多次调用，还可以实现函数在调用失败的时候，再次调用。

    例如，下载出错重试

```

def retry_method_with_fix(fix_method):

    def _creator(func):
        @wraps(func)
        def wrapper(self, *args, **kwargs):
            # pylint: disable=W0703,bare-except
            try:
                return func(self, *args, **kwargs)
            except:
                fix_method(self)
                return func(self, *args, **kwargs)

        return wrapper

    # 返回的仍然是一个fun，这个fun是fun的修饰器
    return _creator
```



