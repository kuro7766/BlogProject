import 'package:blog_project/_articles/first_article.dart';
import 'package:blog_project/routes/article/unified_markdown.dart';
var articleInfoAndMetasBuilder=[
{'id':'0841a718-f6ab-4ee4-a6d5-be6e1ef2ce44','builder':()=>UniMd(path: "assets/markdown/kaggle 入门总结.md"),'type':'markdown'},
{'id':'ca602923-830d-4c47-aed1-3093eaebc939','builder':()=>UniMd(path: "assets/markdown/机器学习路线.md"),'type':'markdown'},
{'id':'ce68b90f-d14b-44d5-a208-cf6d15e06632','builder':()=>UniMd(path: "assets/markdown/论文阅读技巧.md"),'type':'markdown'},
{'id':'d6cce490-9a87-4f72-92e1-f98f4adcb30e','builder':()=>UniMd(path: "assets/markdown/plan.md"),'type':'markdown'},
{'id':'6b5ab2ce-30f0-47c8-af0a-f8687e50e340','builder':()=>FirstAr(),'type':'widget'},
{'id':'7d3718e5-70a5-4b07-a447-bb9a9bb7ee2c','builder':()=>UniMd(path: "assets/markdown/cuda配置.md"),'type':'markdown'},
{'id':'4d5bbb3f-c1f8-4551-8a71-1de55e475ef8','builder':()=>UniMd(path: "assets/markdown/个人项目总结.md"),'type':'markdown'},
{'id':'32c37e90-3ad8-49e5-ac98-1c2cbedbdfd5','builder':()=>UniMd(path: "assets/markdown/使用dart编写跨平台命令行工具.md"),'type':'markdown'},
{'id':'d70345a1-fc9a-4d6d-bb00-3f7873913236','builder':()=>UniMd(path: "assets/markdown/博客创建的动机.md"),'type':'markdown'},
{'id':'c2bec5b0-3c42-4b47-9c52-3cc7e51e7aa5','builder':()=>UniMd(path: "assets/markdown/博客系统日志.md"),'type':'markdown'},
{'id':'90777aff-2ec9-45fa-8c49-8f2df57220e8','builder':()=>UniMd(path: "assets/markdown/实用工具收集.md"),'type':'markdown'},
{'id':'ab44243f-f9ec-4fd4-8a8c-8a9842ef1b1c','builder':()=>UniMd(path: "assets/markdown/摸鱼游戏合集.md"),'type':'markdown'},
{'id':'4c830cae-0237-4708-b6b6-86f2910928b5','builder':()=>UniMd(path: "assets/markdown/无监督学习方法和模型.md"),'type':'markdown'},
{'id':'8e93e278-ccbf-43d9-8ec2-412cbafeefbf','builder':()=>UniMd(path: "assets/markdown/课程设计相关.md"),'type':'markdown'},
{'id':'d3b92e24-3bff-42f6-bd68-e1c16f3ce99e','builder':()=>UniMd(path: "assets/markdown/A Deep Cluster Survey.md"),'type':'markdown'},
{'id':'e5c06b60-bf5f-4a15-a93e-c46f73388f2d','builder':()=>UniMd(path: "assets/markdown/apt安装指定版本.md"),'type':'markdown'},
{'id':'835a2264-8ad6-480e-a7f2-0c867abb087e','builder':()=>UniMd(path: "assets/markdown/batch norm用处.md"),'type':'markdown'},
{'id':'8553ce10-51c8-4d41-9c4d-1ca58b976828','builder':()=>UniMd(path: "assets/markdown/colab ipynb一键生成pdf.md"),'type':'markdown'},
{'id':'9970534d-b886-4272-aba6-cfb7895a7a99','builder':()=>UniMd(path: "assets/markdown/flutter封装.md"),'type':'markdown'},
{'id':'975838e3-64fb-43ca-8d07-581466acae8c','builder':()=>UniMd(path: "assets/markdown/gene入门.md"),'type':'markdown'},
{'id':'607ae674-e0b7-4334-8bf4-e5390b458ec8','builder':()=>UniMd(path: "assets/markdown/getx路由传参.md"),'type':'markdown'},
{'id':'df3eb1f5-5b81-4b51-85be-8739f6be34d7','builder':()=>UniMd(path: "assets/markdown/github pages 免服务器实现评论功能.md"),'type':'markdown'},
{'id':'84327be3-270f-4f7e-85df-f686c2b0e04e','builder':()=>UniMd(path: "assets/markdown/lb第二季op.md"),'type':'markdown'},
{'id':'f514adf4-61fe-4b6f-8a3f-65259a0db55b','builder':()=>UniMd(path: "assets/markdown/ML优质博客收集.md"),'type':'markdown'},
];
var articleInfoAndMetasQuickIndex={'0841a718-f6ab-4ee4-a6d5-be6e1ef2ce44':0,
'ca602923-830d-4c47-aed1-3093eaebc939':1,
'ce68b90f-d14b-44d5-a208-cf6d15e06632':2,
'd6cce490-9a87-4f72-92e1-f98f4adcb30e':3,
'6b5ab2ce-30f0-47c8-af0a-f8687e50e340':4,
'7d3718e5-70a5-4b07-a447-bb9a9bb7ee2c':5,
'4d5bbb3f-c1f8-4551-8a71-1de55e475ef8':6,
'32c37e90-3ad8-49e5-ac98-1c2cbedbdfd5':7,
'd70345a1-fc9a-4d6d-bb00-3f7873913236':8,
'c2bec5b0-3c42-4b47-9c52-3cc7e51e7aa5':9,
'90777aff-2ec9-45fa-8c49-8f2df57220e8':10,
'ab44243f-f9ec-4fd4-8a8c-8a9842ef1b1c':11,
'4c830cae-0237-4708-b6b6-86f2910928b5':12,
'8e93e278-ccbf-43d9-8ec2-412cbafeefbf':13,
'd3b92e24-3bff-42f6-bd68-e1c16f3ce99e':14,
'e5c06b60-bf5f-4a15-a93e-c46f73388f2d':15,
'835a2264-8ad6-480e-a7f2-0c867abb087e':16,
'8553ce10-51c8-4d41-9c4d-1ca58b976828':17,
'9970534d-b886-4272-aba6-cfb7895a7a99':18,
'975838e3-64fb-43ca-8d07-581466acae8c':19,
'607ae674-e0b7-4334-8bf4-e5390b458ec8':20,
'df3eb1f5-5b81-4b51-85be-8739f6be34d7':21,
'84327be3-270f-4f7e-85df-f686c2b0e04e':22,
'f514adf4-61fe-4b6f-8a3f-65259a0db55b':23,};