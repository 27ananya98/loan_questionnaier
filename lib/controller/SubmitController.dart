
import 'package:get/get.dart';

class SubmitController extends GetxController{
  RxList<List<String>> selectedOptions = <List<String>>[].obs;
@override
  void onReady() {
    selectedOptions(Get.arguments);
    print(selectedOptions);
    super.onReady();
  }

}