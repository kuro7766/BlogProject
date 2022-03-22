import 'dart:io';
// 删除生成的临时文件夹
main(){
  File('assets/generated').delete(recursive:true);
}