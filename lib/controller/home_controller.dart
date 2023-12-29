

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../model/question.dart';
import '../routes/RoutesClass.dart';

class HomeController extends GetxController{


  var  indexValue = [].obs;
  final questionModel = Question().obs;
  RxInt currentIndex=0.obs;
  var textFields = <TextEditingController>[].obs;
  RxInt selectedOptionIndex = RxInt(-1);


  RxList<List<String>> selectedOptions = <List<String>>[].obs;


  void updateSelectedOptionIndex(int index) {
    selectedOptionIndex.value = index;
  }


  void handleSingleSelect(int index) {
    String selectedOption = questionModel.value.schema?.fields?[currentIndex.value].schema?.options?[index].value ?? '';

    // Check if the selected option is already in the list
    if (selectedOptions[currentIndex.value].contains(selectedOption)) {
      // If yes, remove it (deselect)
      selectedOptions[currentIndex.value].remove(selectedOption);
    } else {
      // If not, clear the list and add the selected option (select)
      selectedOptions[currentIndex.value] = [selectedOption];
    }

    update();
  }


  void nextQuestion(){
  ++currentIndex.value;
}
void prevQuestion(){
  --currentIndex.value;
}
  @override
  void onInit() {

    loadJsonFromAssets().then((value) {
      questionModel(Question.fromJson(value));
      selectedOptions.value=questionModel.value.schema?.fields?.map((e) => ['']).toList()??[];
    });


    print(questionModel.value.title);
    super.onInit();


  }


  Future<dynamic> loadJsonFromAssets() async {
    Map<String, dynamic> data = await parseJsonFromAssets('assets/Questions.json');
    return data;
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  void gotoSumitScreen(){
    Get.toNamed(RoutesClass.gotoSubmit(),arguments: selectedOptions);
  }
}