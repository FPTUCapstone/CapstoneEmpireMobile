class ItemResponseModel {
  ItemResponseModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.isActived,
    this.isPriceHidden,
    this.isService,
    this.description,
    required this.photo,
    this.categoryId,
    this.category,
    this.prices,
  });

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActived;
  bool? isPriceHidden;
  bool? isService;
  String? description;
  String photo;
  int? categoryId;
  CategoryResponseModel? category;
  List<PriceResponseModel>? prices;

  factory ItemResponseModel.fromJson(Map<String, dynamic> json) {
    return ItemResponseModel(
      id: json['id'],
      name: json['name'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isActived: json['isActived'],
      isPriceHidden: json['isPriceHidden'],
      isService: json['isService'],
      description: json['description'] ?? "null",
      photo: json['photo'] ?? "null",
      categoryId: json['categoryId'],
      category: json['category'] != null
          ? CategoryResponseModel.fromJson(json['category'])
          : null,
      prices: json['prices'] != null
          ? List<PriceResponseModel>.from(
              json['prices'].map((x) => PriceResponseModel.fromJson(x)))
          : null,
    );
  }
}

class CategoryResponseModel {
  CategoryResponseModel(
      {required this.id,
      required this.name,
      this.createdAt,
      this.updatedAt,
      this.isActived,
      required this.groupServiceId,
      required this.groupService});

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActived;
  int groupServiceId;
  GroupServiceResponseModel groupService;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      id: json['id'],
      name: json['name'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isActived: json['isActived'][0],
      groupServiceId: json['groupServiceId'],
      groupService: GroupServiceResponseModel.fromJson(json['groupService']),
    );
  }
}

class GroupServiceResponseModel {
  GroupServiceResponseModel(
      {required this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.isActived});

  int id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActived;

  factory GroupServiceResponseModel.fromJson(Map<String, dynamic> json) {
    return GroupServiceResponseModel(
      id: json['id'],
      name: json['name'] ?? "null",
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isActived: json['isActived'][0],
    );
  }
}

class PriceResponseModel {
  PriceResponseModel({
    required this.id,
    required this.price1,
    this.priceFrom,
    this.itemId,
  });

  int id;
  double? price1;
  DateTime? priceFrom;
  int? itemId;

  factory PriceResponseModel.fromJson(Map<String, dynamic> json) {
    return PriceResponseModel(
      id: json['id'],
      price1: json['price1'],
      priceFrom:
          json['priceFrom'] != null ? DateTime.parse(json['priceFrom']) : null,
      itemId: json['itemId'],
    );
  }
}
