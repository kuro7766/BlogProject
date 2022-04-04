
`docker run -i -t ubuntu:20.04 /bin/bash`

-t: 在新容器内指定一个伪终端或终端。

-i: 允许你对容器内的标准输入 (STDIN) 进行交互


# 可恢复的Docker
` docker run -itd --name ubuntu-test ubuntu:20.04 /bin/bash`

重新执行并进入

`docker exec -it idxxxxxxxxxx /bin/bash`

reboot 后需要用start，环境仍然还在，之后不能docker run，要用start命令

`docker start ubuntu-test`

# 导出导入

`docker export 1e560fca3906 > ubuntu.tar`

`cat docker/ubuntu.tar | docker import - test/ubuntu:v1`

(名称和标签)



# 弹性扩容

参考：

https://www.runoob.com/docker/docker-container-usage.html