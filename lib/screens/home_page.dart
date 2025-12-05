import 'package:currency_app/api/api_settings.dart';
import 'package:currency_app/controller/controller_state.dart';
import 'package:currency_app/widgets/button_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiSettings apiSettings = ApiSettings();

  Map<String, String> currencies = {
    "USD": "دولار أمريكي",
    "SAR": "ريال سعودي",
    "EUR": "يورو",
    "GBP": "جنيه إسترليني",
    "JPY": "ين ياباني",
    "AED": "درهم إماراتي",
    "KWD": "دينار كويتي",
    "BHD": "دينار بحريني",
    "QAR": "ريال قطري",
    "OMR": "ريال عماني",
    "EGP": "جنيه مصري",
    "TRY": "ليرة تركية",
    "AUD": "دولار أسترالي",
    "CAD": "دولار كندي",
    "CHF": "فرنك سويسري",
    "CNY": "يوان صيني",
    "SEK": "كرونة سويدية",
    "NOK": "كرونة نرويجية",
    "DKK": "كرونة دنماركية",
    "INR": "روبية هندية",
    "PKR": "روبية باكستانية",
    "BDT": "تاكا بنغلاديش",
    "IDR": "روبية إندونيسية",
    "MYR": "رينغيت ماليزي",
    "PHP": "بيسو فلبيني",
    "NGN": "نايرا نيجيرية",
    "ZAR": "راند جنوب أفريقي",
    "BRL": "ريال برازيلي",
    "MXN": "بيسو مكسيكي",
    "RUB": "روبل روسي",
    "ILS": "شيكل إسرائيلي",
    "KRW": "وون كوري",
    "SGD": "دولار سنغافوري",
    "NZD": "دولار نيوزلندي",
    "HKD": "دولار هونغ كونغ",
    "ARS": "بيسو أرجنتيني",
    "COP": "بيسو كولومبي",
    "PLN": "زلوتي بولندي",
    "CZK": "كرونة تشيكية",
    "HUF": "فورنت مجري",
  };

  String fromValueSelected = "USD – دولار أمريكي";
  String toValueSelected = "USD – دولار أمريكي";

  TextEditingController controller = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Currency App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// ================== FROM ==================
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton(
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      value: fromValueSelected,
                      items: currencies.entries.map((e) {
                        String value = "${e.key} – ${e.value}";
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          fromValueSelected = value!;
                          Get.find<ControllerState>().simplevaluefrom.value =
                              fromValueSelected.split(" – ")[0];
                        });
                      },
                    ),
                    const SizedBox(width: 18),
                    Text(
                      ":العملة المراد التحويل منها",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// ================== TO ==================
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton(
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      value: toValueSelected,
                      items: currencies.entries.map((e) {
                        String value = "${e.key} – ${e.value}";
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          toValueSelected = value!;
                          Get.find<ControllerState>().simplevalueto.value =
                              toValueSelected.split(" – ")[0];
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      ":العملة المراد التحويل إليها",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// ================== INPUT ==================
                TextFormField(style: const TextStyle(color: Colors.black),
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                /// ================== BUTTON ==================
                buildButton("Convert", () async {
                  await apiSettings.getinformation();

                  Map rates = Get.find<ControllerState>().rates;

                  if (controller.text.isNotEmpty) {
                    try {
                      double amount = double.parse(controller.text);

                      double fromRate = rates[
                          Get.find<ControllerState>().simplevaluefrom.value].toDouble();
                          print("========= FROM RATE: $fromRate ===========");

                      double toRate = rates[
                          Get.find<ControllerState>().simplevalueto.value].toDouble();

                      setState(() {
                        result = (toRate / fromRate) * amount;
                        Get.find< ControllerState>().amount.value = result;
                      });

                      print("==== RESULT: $result ====");

                    } catch (e) {
                      print("Error converting: $e");
                    }
                  }
                }),

                const SizedBox(height: 20),

                /// ================== RESULT ==================
                Obx(() => Text(
                  "Result: ${Get.find<ControllerState>().amount.value.toStringAsFixed(2)} ",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
