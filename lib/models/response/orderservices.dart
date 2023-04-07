class OrderServicesResponseModel {
  int id;
  int status;
  String? code;
  Expert? expert;
  Car car;
  HealthCarRecord? healthCarRecord;
  Order order;
  List<OrderServiceDetails>? orderServiceDetails;

  OrderServicesResponseModel({
    required this.id,
    required this.status,
    this.expert,
    this.code,
    required this.car,
    this.healthCarRecord,
    required this.order,
    required this.orderServiceDetails,
  });

  factory OrderServicesResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderServicesResponseModel(
      id: json['id'],
      status: json['status'],
      code: json['code'],
      expert: json['expert'] != null ? Expert.fromJson(json['expert']) : null,
      car: Car.fromJson(json['car']),
      healthCarRecord: json['healthCarRecord'] != null
          ? HealthCarRecord.fromJson(json['healthCarRecord'])
          : null,
      order: Order.fromJson(json['order']),
      orderServiceDetails: json['orderServiceDetails'] != null
          ? List<OrderServiceDetails>.from(json['orderServiceDetails']
              .map((x) => OrderServiceDetails.fromJson(x)))
          : null,
    );
  }
}

class Expert {
  int id;
  String fullname;
  String? phone; // nullable property
  String email;
  String? gender; // nullable property

  Expert({
    required this.id,
    required this.fullname,
    this.phone,
    required this.email,
    this.gender,
  });

  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      id: json['id'],
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'phone': phone,
        'email': email,
        'gender': gender,
      };
}

class Car {
  int id;
  String carLisenceNo;
  String carBrand;
  String carModel;

  Car({
    required this.id,
    required this.carLisenceNo,
    required this.carBrand,
    required this.carModel,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      carLisenceNo: json['carLisenceNo'],
      carBrand: json['carBrand'],
      carModel: json['carModel'],
    );
  }
}

class HealthCarRecord {
  int? id;
  String? symptom;
  List<HealthCarRecordProblem>? healthCarRecordProblems;

  HealthCarRecord({
    required this.id,
    this.symptom,
    this.healthCarRecordProblems,
  });

  HealthCarRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symptom = json['symptom'];
    if (json['healthCarRecordProblems'] != null) {
      healthCarRecordProblems = <HealthCarRecordProblem>[];
      json['healthCarRecordProblems'].forEach((v) {
        healthCarRecordProblems?.add(HealthCarRecordProblem.fromJson(v));
      });
    }
  }
}

class HealthCarRecordProblem {
  Problem problem;
  HealthCarRecordProblem({required this.problem});
  factory HealthCarRecordProblem.fromJson(Map<String, dynamic> json) {
    return HealthCarRecordProblem(
      problem: Problem.fromJson(json['problem']),
    );
  }
}

class Problem {
  int? id;
  String? name;
  List<Item2>? items;

  Problem({
    this.id,
    this.name,
    this.items,
  });

  Problem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Item2>[];
      json['items'].forEach((v) {
        items?.add(Item2.fromJson(v));
      });
    }
  }
}

class SlimProblem {
  int? id;
  String? name;

  SlimProblem({
    this.id,
    this.name,
  });

  SlimProblem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Item2 {
  int id;
  String name;
  String? photo;
  double? presentPrice;

  Item2({
    required this.id,
    required this.name,
    this.photo,
    required this.presentPrice,
  });

  factory Item2.fromJson(Map<String, dynamic> json) {
    return Item2(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      presentPrice: json['presentPrice'] != null
          ? double.parse(json['presentPrice'].toString())
          : null,
    );
  }
}

class Order {
  int id;
  String createdAt;
  String updatedAt;
  User user;
  // Transaction? transaction;

  Order({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    // required this.transaction,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: User.fromJson(json['user']),
      // transaction: json['transaction'] != null
      //     ? Transaction.fromJson(json['transaction'])
      //     : null,
    );
  }
}

class User {
  String fullname;
  String phone;
  String? email;
  bool? gender;

  User({
    required this.fullname,
    required this.phone,
    this.email,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}

class Transaction {
  int total;
  int paymentMethod;

  Transaction({
    required this.total,
    required this.paymentMethod,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      total: json['total'],
      paymentMethod: json['paymentMethod'],
    );
  }
}

class OrderServiceDetails {
  int? id;
  int? price;
  bool? isConfirmed;
  Item? item;

  OrderServiceDetails({this.id, this.price, this.isConfirmed, this.item});

  OrderServiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    isConfirmed = json['isConfirmed'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['isConfirmed'] = isConfirmed;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonLesser() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isConfirmed'] = isConfirmed;
    return data;
  }
}

class Item {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? photo;
  Category? category;
  SlimProblem? problem;

  Item(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.photo,
      this.category,
      this.problem});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    photo = json['photo'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    problem =
        json['problem'] != null ? SlimProblem.fromJson(json['problem']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['photo'] = photo;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
