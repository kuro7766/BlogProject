import 'package:blog_project/_articles/first_article.dart';

void main() {
  var a = [
    [4.7, 0],
    [4.4, 0],
    [4.5, 0],
    [4.5, 0],
    [4.5, 0],
    [4.2, 0],
    [4, 0],
    [3.5, 0],
    [3, 0],
    [3, 0],
    [1, 0],
  ];
  var degree = 0.75;

  var index = 0;
  a.forEach((element) {
    var tmp = (element[0] * degree) / 5.0;
    degree = tmp;
    index++;
    print('| #$index |${(degree * 100).toStringAsFixed(2)}%|${element[0]}|');
  });
}
