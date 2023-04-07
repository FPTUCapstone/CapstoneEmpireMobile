class OrderServiceDetailRequestModel {
  int itemId;
  double price;
  OrderServiceDetailRequestModel({
    required this.itemId,
    required this.price,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemId'] = itemId;
    data['price'] = price;
    return data;
  }
}
