import 'dart:math';

import 'package:get/get.dart';

class Shulte_gameLogic extends GetxController {
  List<List<int>> data = List.generate(5, (i) => List.generate(5, (j) => 0));
  int nextTap = 1;
  var right = true.obs;
  var myRefresh=0.obs;
  DateTime start = DateTime.now();

  @override
  void onInit() {
    super.onInit();

    generate();
  }

  void generate() {
    //  random set 0-25 to data,each num only once
    List<int> nums = List.generate(25, (i) => i + 1);
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        int index = Random().nextInt(nums.length);
        data[i][j] = nums[index];
        nums.removeAt(index);
      }
    }
  }

  int getValue(int x, int y) {
    return data[x][y];
  }

//  shulte game ontap
  void onTap(int i, int j) {
    if (nextTap == 1) {
      start = DateTime.now();
    }
    if (data[i][j] == nextTap) {
      nextTap++;
      right.value = true;
      if (nextTap > 25) {
        Get.snackbar("成绩", "${((DateTime.now().millisecondsSinceEpoch - start.millisecondsSinceEpoch)~/100)/10}s",
            snackPosition: SnackPosition.BOTTOM);
        nextTap = 1;
        generate();
        myRefresh++;
      }
    } else {
      right.value = false;
    }
  }
}
