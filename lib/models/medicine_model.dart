class MedicineModel {
  final dynamic id;
  final String scientific_name;
  final String trade_name;
  final String manufacturer;
  final dynamic quantity_available;
  final dynamic price;
  final DateTime expiry_date;
  final String category;
  MedicineModel({
    required this.id,
    required this.scientific_name,
    required this.trade_name,
    required this.manufacturer,
    required this.quantity_available,
    required this.price,
    required this.expiry_date,
    required this.category,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
        id: json['id'],
        trade_name: json['trade_name'],
        manufacturer: json['manufacturer'],
        price: json['price'],
        quantity_available: json['quantity_available'],
        scientific_name: json['scientific_name'],
        category: json["category"],
        expiry_date: DateTime.parse(json['expiry_date']));
  }
}
