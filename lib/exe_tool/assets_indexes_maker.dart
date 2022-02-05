import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:blog_project/indexes/editable_article_info_and_meta_indexes.dart';

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: true);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

void main() async {
  var assetFiles = await dirContents(Directory('assets/markdown'));
  articleInfoAndMetas=articleInfoAndMetas.where((element) => element['type']=='markdown').toList();

  var scriptMeta={};
  //         .where((element) async {
  //   var f = File(element.path);
  //   var content =await f.readAsString();
  //   RegExp(r'@ArticleMetaData\(.*?\)',multiLine: true).firstMatch(content);
  // });
  // print(assetFiles);
  for (var value in assetFiles) {
    var f = File(value.path);
    var content = await f.readAsString();
    final stat = FileStat.statSync(value.path);
    // print(value.path);
    var t = stat.changed.millisecondsSinceEpoch;

    print(t);

    var formatPath = value.path.replaceAll('\\', '/');
    print(formatPath);

    dynamic preObject = null;
    var shouldUpdateMarkdown = articleInfoAndMetas.where((dict) {
          preObject = dict;
          return dict['path'] == formatPath;
        }).length ==
        0;

    // 构想
    // var articleInfoAndMetasBuilder=[{'id':'aaa','builder':()=>UnifiedMarkdown()}];
    if (shouldUpdateMarkdown) {
      articleInfoAndMetas.add({
        'id': Uuid().v4(),
        'path': formatPath,
        'time': t,
        'type': 'markdown',
        'builder': '()=>UniMd(path: "$formatPath")',
        'checked':true
      });
    } else {
      // articleInfoAndMetas.add({
      //   'id': preObject['id'],
      //   'path': preObject['path'],
      //   'time': preObject['time'],
      //   'type': 'markdown',
      //   'builder': '()=>UniMd(path: "${preObject['path']}")'
      // });
      articleInfoAndMetas.forEach((dict) {
        if(dict['path'] == formatPath){
          dict['builder']='()=>UniMd(path: "$formatPath")';
          dict['checked']=true;
        }
      });
    }
  }

  articleInfoAndMetas=articleInfoAndMetas.where((element) => element.containsKey('checked')).toList();

  print(articleInfoAndMetas);

  for (var element in (await dirContents(Directory('lib/_articles')))) {
    var f = File(element.path);
    var content = await f.readAsString();
    var match = RegExp(
        r'(?<=@ArticleMetaData\()[\d\D]*?\)[\s\S]*?class\s[\w\d\_]+(?=\s)',
        multiLine: true)
        .stringMatch(content);

    if (match == null) continue;
    var metaJson = jsonDecode(RegExp(r'[\s\S]*\}').stringMatch(match));
    var className = RegExp(r'(?<=class\s)[\w\d\_]+').stringMatch(match);
    print(metaJson);
    print(className);

    articleInfoAndMetas.add({
      'id': Uuid().v4(),
      'import':
      "import 'package:blog_project/${element.path.replaceAll('\\', '/').replaceAll('lib/', '')}';",
      'time': DateTime.parse(metaJson['date']).millisecondsSinceEpoch,
      'path': element.path.replaceAll('\\', '/'),
      'type': 'widget',
      'builder': '()=>$className()'
    });

    // var j=jsonDecode(match);
    // print(j);
    // print(j['title']);
  }

  var prefix = 'lib/indexes/';
  // var manualIndexesInfo='lib/indexes/editable_article_info_and_meta_indexes.dart';
  // var generateIndexesInfo='lib/indexes/generated_framework_widget_indexes.dart';
  var manualIndexesInfo =
      // prefix + 'editable_article_info_and_meta_indexes.dart.switch';
      prefix + 'editable_article_info_and_meta_indexes.dart';
  var generateIndexesInfo = prefix + 'generated_framework_widget_indexes.dart';

  articleInfoAndMetas.sort((a, b) {
    return (b['time'] as num) - (a['time'] as num);
  });

  var ss = [];
  var imports = [];
  var ss2 = [];
  var imports2 = [];
  var ss3=[];
  var index=0;
  articleInfoAndMetas.forEach((element) {
    ss.add("{'path':'${element['path']}','tag':'','id':'${element['id']}','time':${element['time']},'type':'${element['type']}'},");
    ss3.add("'${element['id']}':$index,");
    ss2.add(
        "{'id':'${element['id']}','builder':${element['builder']},'type':'${element['type']}'},");
    // print(s);
    if (element['type'] == 'widget') {
      print(element['import']);
      imports2.add(element['import']);
    }
    index++;

  });
  var scripts =
      ("${imports2.join('\n')}\nimport 'package:blog_project/routes/article/unified_markdown.dart';\nvar articleInfoAndMetasBuilder=[\n${ss2.join('\n')}\n];\n"
          "var articleInfoAndMetasQuickIndex={${ss3.join('\n')}};");
  File(generateIndexesInfo).writeAsStringSync(scripts);

  File(manualIndexesInfo).writeAsString("""
List<dynamic> articleInfoAndMetas = \n[${ss.join('\n')}];
  """);
  print(ss);
//var articleInfoAndMetas = [];
}
