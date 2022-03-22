import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';
import 'package:path/path.dart' as p;
//用于转换dart文件，生产出来的文件会带一个前缀d-

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
  await Directory(p.join('assets/', 'generated')).create();
  var shell = Shell(stdoutEncoding: Encoding.getByName('utf-8'));
  for (var i = 0; i < dirs.length; i++) {
    var element = dirs[i];

    var old = Directory(element.path);
    // is element a directory?
    if (element is Directory) {
    } else {
      await shell.run('''tools/MdConverter "${element.path}"''');
    }
    // element.rename(p.join(element.parent.path,p.basename(element.path)));
    // await shell.run('''tools/MdConverter "${element.path}"''');
    // await Future.delayed(Duration(milliseconds: 200));

    // var tmp = (p.join(element.parent.parent.path, 'generated',
    //     '${DateTime.now().millisecondsSinceEpoch}', p.basename(element.path)));
    //
    //
    //
    // await element.rename(p.join(
    //     element.parent.parent.path, 'generated', p.basename(element.path)));
    //
    //
    //
    // // print(old);
    // await Directory(p.join(old.parent.path, 'd-' + p.basename(old.path)))
    //     .rename(old.path);
  }
  dirs = (await dirContents(Directory(('assets/markdown'))));
  print(dirs);
  // return;

  var to = await Directory(p.join(
          'assets/', 'generated', '${DateTime.now().millisecondsSinceEpoch}'))
      .create();
  for (var i = 0; i < dirs.length; i++) {
    var element = dirs[i];
    if (p.basename(element.path).startsWith('d-')) {
      // await element.delete();
      // await File(element.path).rename(
      //     p.join(element.parent.path, 'sss',p.basename(element.path).substring(2)));
    } else {
      // var target = p.join(
      //     to.path, p.basename(element.path.replaceAll('assets/markdown', '')));
      // print(target);
      // await element.rename(target);
      if (element is Directory) {
      } else {
        element.deleteSync();
      }
      // await Directory((element.path)).rename(target);
    }
  }
  return;
  for (var i = 0; i < dirs.length; i++) {
    var element = dirs[i];
    if (p.basename(element.path).startsWith('d-')) {
      // await element.delete();
      await File(element.path).rename(p.join(Directory.current.path,
          element.parent.path, 'sss', p.basename(element.path).substring(2)));
    } else {
      // await Directory(p.fromUri(element.path)).rename(p.join(
      //     element.parent.path,
      //     'generated',
      //     '${DateTime.now().millisecondsSinceEpoch}',
      //     p.basename(element.path)));
    }
  }
}
