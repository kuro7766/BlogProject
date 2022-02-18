import 'package:blog_project/_articles/shulte_game/view.dart';
import 'package:blog_project/_articles/react1/view.dart';
import 'package:blog_project/_articles/first_article.dart';
import 'package:blog_project/routes/article/unified_markdown.dart';
var articleInfoAndMetasBuilder=[
{'id':'e76ee308-2a4b-4123-94a1-7fcf74ded1a3','builder':()=>UniMd(path: "assets/markdown/DL/GNN.md"),'type':'markdown'},
{'id':'79c57614-abef-45c9-87d7-d4d1296e18d5','builder':()=>UniMd(path: "assets/markdown/基础知识/范数.md"),'type':'markdown'},
{'id':'07ff1549-5316-4142-85ff-0f313ad323e0','builder':()=>UniMd(path: "assets/markdown/pytorch代码编写.md"),'type':'markdown'},
{'id':'d44c33a0-61d1-4f4c-b225-a17e46d5a671','builder':()=>UniMd(path: "assets/markdown/实习/NLP实习面经收集.md"),'type':'markdown'},
{'id':'5bf2259e-2344-4a52-a798-3aa22bf648a7','builder':()=>UniMd(path: "assets/markdown/深度学习工具网站.md"),'type':'markdown'},
{'id':'5e78add9-963f-428c-88dd-8e5c4bd43038','builder':()=>UniMd(path: "assets/markdown/深度学习-学习资料.md"),'type':'markdown'},
{'id':'adb75a2c-7f55-4c39-9602-27ed808c10e4','builder':()=>Shulte_gameComponent(),'type':'widget'},
{'id':'59e5c817-d576-4a75-a30d-083b985bd24d','builder':()=>React1Component(),'type':'widget'},
{'id':'bb243588-14d4-401a-a5c3-6fa487db8509','builder':()=>UniMd(path: "assets/markdown/pytorch cuda配置.md"),'type':'markdown'},
{'id':'9f063ad9-7181-4f59-ad32-c33631658719','builder':()=>UniMd(path: "assets/markdown/leetcode/leetcode笔记_2月.md"),'type':'markdown'},
{'id':'868a1dc8-1e08-46cf-b919-5fd136be7a21','builder':()=>UniMd(path: "assets/markdown/机器学习路线.md"),'type':'markdown'},
{'id':'0a8a3697-78ee-4db1-bb1b-0cd2460175f3','builder':()=>UniMd(path: "assets/markdown/概念速查.md"),'type':'markdown'},
{'id':'8162d495-8892-4cba-89d7-f87230f8cf95','builder':()=>UniMd(path: "assets/markdown/论文阅读技巧.md"),'type':'markdown'},
{'id':'7e059a82-1483-4637-aeec-d3bd72df4ad6','builder':()=>UniMd(path: "assets/markdown/BERT-GAN.md"),'type':'markdown'},
{'id':'8bd58615-4bd9-47ab-85b5-6a8325636328','builder':()=>UniMd(path: "assets/markdown/kaggle 入门总结.md"),'type':'markdown'},
{'id':'5d941355-b341-4d84-92de-d8d9cdd27521','builder':()=>UniMd(path: "assets/markdown/nlp路线.md"),'type':'markdown'},
{'id':'5f291250-c509-4c2a-a02f-1ad5e5ac2dc5','builder':()=>UniMd(path: "assets/markdown/代码速查.md"),'type':'markdown'},
{'id':'5bcb3d18-14c4-4eb2-94ae-2a180793e212','builder':()=>UniMd(path: "assets/markdown/Flutter笔记.md"),'type':'markdown'},
{'id':'d6cce490-9a87-4f72-92e1-f98f4adcb30e','builder':()=>UniMd(path: "assets/markdown/plan.md"),'type':'markdown'},
{'id':'6b5ab2ce-30f0-47c8-af0a-f8687e50e340','builder':()=>FirstAr(),'type':'widget'},
{'id':'c2bec5b0-3c42-4b47-9c52-3cc7e51e7aa5','builder':()=>UniMd(path: "assets/markdown/博客系统日志.md"),'type':'markdown'},
{'id':'90777aff-2ec9-45fa-8c49-8f2df57220e8','builder':()=>UniMd(path: "assets/markdown/实用工具收集.md"),'type':'markdown'},
{'id':'ab44243f-f9ec-4fd4-8a8c-8a9842ef1b1c','builder':()=>UniMd(path: "assets/markdown/摸鱼游戏合集.md"),'type':'markdown'},
{'id':'32c37e90-3ad8-49e5-ac98-1c2cbedbdfd5','builder':()=>UniMd(path: "assets/markdown/使用dart编写跨平台命令行工具.md"),'type':'markdown'},
{'id':'8e93e278-ccbf-43d9-8ec2-412cbafeefbf','builder':()=>UniMd(path: "assets/markdown/课程设计相关.md"),'type':'markdown'},
{'id':'4d5bbb3f-c1f8-4551-8a71-1de55e475ef8','builder':()=>UniMd(path: "assets/markdown/个人项目总结.md"),'type':'markdown'},
{'id':'d70345a1-fc9a-4d6d-bb00-3f7873913236','builder':()=>UniMd(path: "assets/markdown/博客创建的动机.md"),'type':'markdown'},
{'id':'4c830cae-0237-4708-b6b6-86f2910928b5','builder':()=>UniMd(path: "assets/markdown/无监督学习方法和模型.md"),'type':'markdown'},
{'id':'df3eb1f5-5b81-4b51-85be-8739f6be34d7','builder':()=>UniMd(path: "assets/markdown/github pages 免服务器实现评论功能.md"),'type':'markdown'},
{'id':'8553ce10-51c8-4d41-9c4d-1ca58b976828','builder':()=>UniMd(path: "assets/markdown/colab ipynb一键生成pdf.md"),'type':'markdown'},
{'id':'975838e3-64fb-43ca-8d07-581466acae8c','builder':()=>UniMd(path: "assets/markdown/gene入门.md"),'type':'markdown'},
{'id':'835a2264-8ad6-480e-a7f2-0c867abb087e','builder':()=>UniMd(path: "assets/markdown/batch norm用处.md"),'type':'markdown'},
{'id':'e5c06b60-bf5f-4a15-a93e-c46f73388f2d','builder':()=>UniMd(path: "assets/markdown/apt安装指定版本.md"),'type':'markdown'},
{'id':'d3b92e24-3bff-42f6-bd68-e1c16f3ce99e','builder':()=>UniMd(path: "assets/markdown/A Deep Cluster Survey.md"),'type':'markdown'},
{'id':'84327be3-270f-4f7e-85df-f686c2b0e04e','builder':()=>UniMd(path: "assets/markdown/lb第二季op.md"),'type':'markdown'},
];
var articleInfoAndMetasQuickIndex={'e76ee308-2a4b-4123-94a1-7fcf74ded1a3':0,
'79c57614-abef-45c9-87d7-d4d1296e18d5':1,
'07ff1549-5316-4142-85ff-0f313ad323e0':2,
'd44c33a0-61d1-4f4c-b225-a17e46d5a671':3,
'5bf2259e-2344-4a52-a798-3aa22bf648a7':4,
'5e78add9-963f-428c-88dd-8e5c4bd43038':5,
'adb75a2c-7f55-4c39-9602-27ed808c10e4':6,
'59e5c817-d576-4a75-a30d-083b985bd24d':7,
'bb243588-14d4-401a-a5c3-6fa487db8509':8,
'9f063ad9-7181-4f59-ad32-c33631658719':9,
'868a1dc8-1e08-46cf-b919-5fd136be7a21':10,
'0a8a3697-78ee-4db1-bb1b-0cd2460175f3':11,
'8162d495-8892-4cba-89d7-f87230f8cf95':12,
'7e059a82-1483-4637-aeec-d3bd72df4ad6':13,
'8bd58615-4bd9-47ab-85b5-6a8325636328':14,
'5d941355-b341-4d84-92de-d8d9cdd27521':15,
'5f291250-c509-4c2a-a02f-1ad5e5ac2dc5':16,
'5bcb3d18-14c4-4eb2-94ae-2a180793e212':17,
'd6cce490-9a87-4f72-92e1-f98f4adcb30e':18,
'6b5ab2ce-30f0-47c8-af0a-f8687e50e340':19,
'c2bec5b0-3c42-4b47-9c52-3cc7e51e7aa5':20,
'90777aff-2ec9-45fa-8c49-8f2df57220e8':21,
'ab44243f-f9ec-4fd4-8a8c-8a9842ef1b1c':22,
'32c37e90-3ad8-49e5-ac98-1c2cbedbdfd5':23,
'8e93e278-ccbf-43d9-8ec2-412cbafeefbf':24,
'4d5bbb3f-c1f8-4551-8a71-1de55e475ef8':25,
'd70345a1-fc9a-4d6d-bb00-3f7873913236':26,
'4c830cae-0237-4708-b6b6-86f2910928b5':27,
'df3eb1f5-5b81-4b51-85be-8739f6be34d7':28,
'8553ce10-51c8-4d41-9c4d-1ca58b976828':29,
'975838e3-64fb-43ca-8d07-581466acae8c':30,
'835a2264-8ad6-480e-a7f2-0c867abb087e':31,
'e5c06b60-bf5f-4a15-a93e-c46f73388f2d':32,
'd3b92e24-3bff-42f6-bd68-e1c16f3ce99e':33,
'84327be3-270f-4f7e-85df-f686c2b0e04e':34,};