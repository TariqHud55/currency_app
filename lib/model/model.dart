class Model{
  final String currencySymbol;
  final double currency;
  Model({required this.currencySymbol, required this.currency});
  factory Model.fromJson(Map<String,dynamic> json){
    return Model(
      currencySymbol: json['currencySymbol'],
      currency: json['currency'].toDouble(),
    );
  }
}