class Tests{
  static var s='''
  # flutter web打包asset图片不显示问题

首先找到flutter build web打包的文件位置

```java
@KeepApplication
public class Application
{
    public static void main(String[] args)
    {
        System.out.println("The answer is 42");
    }
}
```
本人在打包flutter后，在build目录中找到web目录后，上传到linux上的apache目录 /var/www/flutter应用目录/下，出现asset目录下图片加载不出来的情况



**解决办法:**

把打包后的web目录下的index.html文件中的<base></base>标签中的href=“/”改成你网站的目录

例如href="http://www.abc.com/yoursubpath/"

其实index.html的注释已经说明了

  ''';
  static var s2=r'''
  # 查询至少选了1班2号同学所选课的所有班号、学号

这类问题应该是本学期数据库查询里比较难的题了，涉及到了exists的使用，但是搞清楚原理还是很简单的。

假设有学生选课表sc(sclass,sno,cno)，其他属性忽略不计

## 1.元组演算

### 关系图形表示

以下的四张表均为sc表，他们的关联关系如下


### 关系演算

$\exists u(sc(u)\land\forall w(sc(w)\land w[0]=1\land w[1]=2)\rightarrow\exist v(w[3]=v[3]\land u[0]=v[0]\land u[1]=v[1]))$

## 2.元组演算转换成没有$\forall$符号的语句

转换之前需要把元组演算中的所有$\forall$语句全部转换成$\exist$语句，这里涉及到数理逻辑的知识


**注意，3)4)中的$\forall\exists$互转后里面的P也要取反**

转换后的结果如下

$\exists u(sc(u)\land\lnot\exist w(sc(w)\land w[0]=1\land w[1]=2)\land\lnot\exist v(w[3]=v[3]\land u[0]=v[0]\land u[1]=v[1]))$



## 3.sql语句

```sql
select * from sc u
where not exists(
	select * from sc w
    where sc.sno=2 and sc.sclass=1
    and not exists(
    	select * from sc v
        where w.cno=v.cno and 
        u.sno=v.sno and u.sclass=v.sclass
    )
)
```

基本上和2中的每个符号按顺序对应，应该也比较容易理解




  ''';
}