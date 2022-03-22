import 'dart:io';

import 'package:yaml/yaml.dart';
import 'package:json2yaml/json2yaml.dart';
import 'dart:convert';
import 'dart:async';

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: true);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

// 为了解决附件中新建文件夹没有被添加到pub的问题
main() async {
  var dirs = (await dirContents(Directory(('assets/markdown'))));
  // print(dirs);
  var doc = loadYaml(File('pubspec.yaml').readAsStringSync());
  var docJ = json.decode(json.encode(doc));
  // print(docJ['flutter']['assets']);
  dirs.forEach((element) {
    var tmpPath = (element.parent.path.replaceAll('\\', '/')) + '/';
    print(tmpPath);
    print(docJ['flutter']['assets'].contains(tmpPath));

    if (!docJ['flutter']['assets'].contains(tmpPath)) {
      docJ['flutter']['assets'].add(tmpPath);
    }
  });

  var yaml = json2yaml(docJ);
  File('pubspec.yaml').writeAsStringSync(yaml);
}
