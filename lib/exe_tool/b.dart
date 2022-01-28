import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';
import 'package:path/path.dart' as p;

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
  var dirs = (await dirContents(Directory(('assets/markdown'))));
  print(dirs);
  // return;
  await Directory(p.join('assets/',
      'generated')).create();

  var to=await Directory(p.join('assets/',
      'generated',
      '${DateTime.now().millisecondsSinceEpoch}')).create();

  for (var i = 0; i < dirs.length; i++) {
    var element = dirs[i];
    if (p.basename(element.path).startsWith('d-')) {
      // await element.delete();
      await element.rename(
          p.join(element.parent.path,p.basename(element.path).substring(2)));
    } else {
      // await Directory(p.fromUri(element.path)).rename(p.join(
      //     element.parent.path,
      //     'generated',
      //     '${DateTime.now().millisecondsSinceEpoch}',
      //     p.basename(element.path)));
    }
  }

}
