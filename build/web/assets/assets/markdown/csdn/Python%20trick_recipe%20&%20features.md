
@[toc]

主要收集一些python歪门邪道的东西

# getter&setter without class
详情讨论见[此处](https://stackoverflow.com/questions/880530/can-modules-have-properties-the-same-way-that-objects-can)
这个trick的意义在于，比如在获取一些状态位的时候，发现这个状态位改变的话需要同时改变另一个状态位，或者对另一个状态位有依赖关系，那么就可以通过setter getter增加一些逻辑。那么以前的变量符号相当于一个代理。
# 无法正常获取的attr

```python
setattr(a, "can't touch this", 123)
getattr(a, "can't touch this")
```

# @property
python中的getter方法

```python
class A(object):
    @property
    def prop(self):
        return {'a': 1}
```
A().prop

property本质是一个特殊的对象
```python
C.user = property(lambda self: User.objects.get(self.user_id))
```

# zip

```python
a=[1,2,3]
b= [4,5,6]
for ai,bi in zip(a,b):
    print(ai,bi)

# 转字典也非常方便
print(dict(zip(a,b)))
{1: 4, 2: 5, 3: 6}
```

# __slot__
预先定义类的属性，从而节约内存和提高速度。
更详细的描述参见[此处](https://www.cnblogs.com/rainfd/p/slots.html)，作者说slot可以节省6，7倍左右的内存
# 函数可以有属性

```python
def doNothing():
    pass

doNothing.monkeys = 4
print doNothing.monkeys
4
```
函数其实就是调用对象的__call__()函数，__call__()函数作为一个函数也可以有属性
# lambda的一个坑
```python
funcs = []
for k in range(10):
    funcs.append(lambda : k)
print(funcs[5]())
```
最终返回的是9而不是5

```python
funcs = []
for k in range(10):
    funcs.append(lambda : k)
del k
print(funcs[5]())
```
because `k` in range(10) still maintains in memory after loop is end in previous Code snippet . So when we delete k , lambda will not able to find k reference.

Solution:

```python
funcs = []
for k in range(10):
    funcs.append(lambda k=k: k)
# del k
print(funcs[5]())

# lambda k=k: k
# is the same as
def anoymouse_fun(k=k): # the k before '=' will be recognized as function key
						# and second k will be recognized as key k's default value
	return k
```

# for in
以下代码大家可能比较熟悉
```python
[i for i in range(10)]
```

```python
[0 if i%2==0 else 1 for i in range(10)]
```
还有一种for if是作为过滤器使用的
```python
[(x, 'a') for x in range(4) if x % 2 == 1]
```
输出结果:
```
[(1, 'a'), (3, 'a')]
```

# 运算符重载
以[__mul__](https://stackoverflow.com/a/3693838/14173990)为例，重载的是前面对象的__mul__方法
# GOTO函数

```python
from goto import goto, label
for i in range(1, 10):
    for j in range(1, 20):
        for k in range(1, 30):
            print i, j, k
            if k == 3:
                goto .end # breaking out from a deeply nested loop
label .end
print "Finished"
```

# pprint
[结构化打印](https://stackoverflow.com/a/261833/14173990)，用于debug
```python
import pprint    
stuff = sys.path[:]
stuff.insert(0, stuff)
pprint.pprint(stuff)
[<Recursion on list with id=869440>,
 '',
 '/usr/local/lib/python1.5',
 '/usr/local/lib/python1.5/test',
 '/usr/local/lib/python1.5/sunos5',
 '/usr/local/lib/python1.5/sharedmodules',
 '/usr/local/lib/python1.5/tkinter']```

# 交互控制台
[见此处](https://stackoverflow.com/a/393927/14173990)，这个还不知道有什么妙用
# 列举对象的所有方法

dir("foo")
['__add__', '__class__', '__contains__', (snipped a bunch), 'title',
 'translate', 'upper', 'zfill']
```

# tuple/array unpack
```python
first,second,*rest = (1,2,3,4,5,6,7,8)
first
1
second
2
rest
[3, 4, 5, 6, 7, 8]
```

# tuple unpacking in python 3

>in python 3, you can use a syntax identical to optional arguments in function definition for tuple unpacking:

```python
first,second,*rest = (1,2,3,4,5,6,7,8)
first
1
second
2
rest
[3, 4, 5, 6, 7, 8]
```

# re模块的函数回调
曾经想过可能的功能，没想到python真的有


```python
import re


def Main(haystack):
    # List of from replacements, can be a regex
    finds = ('Hello', 'there', 'Bob')
    replaces = ('Hi,', 'Fred,', 'how are you?')

    def ReplaceFunction(matchobj):
        print('matchobj:', matchobj)
        print('groups:', matchobj.groups())
        for found, rep in zip(matchobj.groups(), replaces):
            if found:
                print(found, rep)
                return rep

        # log error
        return matchobj.group(0)

    named_groups = ['(%s)' % find for find in finds]
    print('|'.join(named_groups))
    ret = re.sub('|'.join(named_groups), ReplaceFunction, haystack)
    print(ret)


if __name__ == '__main__':
    str = 'Hello there Bob'
    Main(str)
    # Prints 'Hi, Fred, how are you?'

```
输出结果:
```
(Hello)|(there)|(Bob)
matchobj: <re.Match object; span=(0, 5), match='Hello'>
groups: ('Hello', None, None)
Hello Hi,
matchobj: <re.Match object; span=(6, 11), match='there'>
groups: (None, 'there', None)
there Fred,
matchobj: <re.Match object; span=(12, 15), match='Bob'>
groups: (None, None, 'Bob')
Bob how are you?
Hi, Fred, how are you?
```
re.Scanner()，原sre.Scanner()，可以在正则定义的时候定义回调，更加方便


```python
import re
def s_ident(scanner, token): return token
def s_operator(scanner, token): return "op%s" % token
def s_float(scanner, token): return float(token)
def s_int(scanner, token): return int(token)
scanner = re.Scanner([
    (r"[a-zA-Z_]\w*", s_ident),
    (r"\d+\.\d*", s_float),
    (r"\d+", s_int),
    (r"=|\+|-|\*|/", s_operator),
    (r"\s+", None),
])
print(scanner.scan("sum = 3*foo + 312.50 + bar"))

```

# 数组运算符重写

```python
class C(object):
...  def __getitem__(self, item):
...   return item
... 
C()[1:2, ..., 3]
(slice(1, 2, None), Ellipsis, 3)
```

# 用函数获取对象的Reference Name

```python
def retrieve_name(var):
    callers_local_vars = inspect.currentframe().f_back.f_locals.items()
    return [var_name for var_name, var_val in callers_local_vars if var_val is var]

```
缺点：
在`a, b = 'f', 'f'`的时候，他们获取的是多个，无法分辨，和底层cpython实现有关。即使如此，也相当方便了。
其中f_back可以多次调用。函数嵌套时使用。
# decorator
一个类似java注解的东西

```python
def print_args(function):
    def wrapper(*args, **kwargs):
        print 'Arguments:', args, kwargs
        return function(*args, **kwargs)
    return wrapper

@print_args
def write(text):
    print text

write('foo')
Arguments: ('foo',) {}
foo
```

# 根据字符串动态生成对象、属性

```python
NewType = type("NewType", (object,), {"x": "hello"})
n = NewType()
n.x
"hello"
which is exactly the same as

class NewType(object):
    x = "hello"
n = NewType()
n.x
"hello"
```

# for/else

```python
for i in foo:
    if i == 0:
        break
else:
    print("i was never 0")
```

> The "else" block will be normally executed at the end of the for loop, unless the break is called.


# 参考资料
[Hidden features of Python - Stack Overflow](https://stackoverflow.com/questions/101268/hidden-features-of-python)


[python - Getting the name of a variable as a string - Stack Overflow](https://stackoverflow.com/questions/18425225/getting-the-name-of-a-variable-as-a-string)


https://stackoverflow.com/questions/880530/can-modules-have-properties-the-same-way-that-objects-can


# @classmethod 和 static

https://stackoverflow.com/questions/12179271/meaning-of-classmethod-and-staticmethod-for-beginner





