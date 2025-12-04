import 'package:currency_app/controller/controller_state.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiSettings {
  final Dio _dio = Dio();
  Future<void> getinformation()async{
    var response=await _dio.get('https://api.exchangerate-api.com/v4/latest/USD');
    if(response.statusCode==200){
      print('response.data==================${response.data}');
      print('==================================================');
      Map result=response.data['rates'];
      Get.find<ControllerState>().rates.addAll(result);
      print('result===================$result');
    }else{
      print('---------------------------Error fetching data======================');
    }
  }
}