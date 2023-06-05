import 'package:get/get.dart';

class Controller extends GetxController{

  var result = "No value yet".obs;

  calculate(String first, String second){
    result.value = "The result is ${int.parse(first) + int.parse(second)}";
  }

}