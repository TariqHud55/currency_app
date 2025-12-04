import 'package:get/get.dart';
class ControllerState extends GetxController {
  RxDouble amount = 0.0.obs;
  RxString simplevaluefrom = "USD".obs;
  RxString simplevalueto = "USD".obs;
  RxMap rates = <String, double>{}.obs;

  
}