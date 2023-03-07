class OrderServicesResponseModel {
  int id;
  int status;
  Car car;
  // HealthCarRecord? healthCarRecord;
  Order order;
  // List<OrderServiceDetails>? orderServiceDetails;

  OrderServicesResponseModel({
    required this.id,
    required this.status,
    required this.car,
    // required this.healthCarRecord,
    required this.order,
    // required this.orderServiceDetails,
  });

  factory OrderServicesResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderServicesResponseModel(
      id: json['id'],
      status: json['status'],
      car: Car.fromJson(json['car']),
      // healthCarRecord: HealthCarRecord.fromJson(json['healthCarRecord']),
      order: Order.fromJson(json['order']),
      // orderServiceDetails: List<OrderServiceDetails>.from(json['orderServiceDetails'].map((x) => OrderServiceDetails.fromJson(x))),
    );
  }
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
  int id;
  String symptom;
  String createdAt;
  String updatedAt;

  HealthCarRecord({
    required this.id,
    required this.symptom,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HealthCarRecord.fromJson(Map<String, dynamic> json) {
    return HealthCarRecord(
      id: json['id'],
      symptom: json['symptom'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Order {
  int id;
  String createdAt;
  String updatedAt;
  User user;
  Transaction? transaction;

  Order({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.transaction,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: User.fromJson(json['user']),
      transaction: json['transaction'] != null ? Transaction.fromJson(json['transaction']) : null,
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
  int id;
  int price;
  bool isConfirmed;


  OrderServiceDetails({
    required this.id,
    required this.price,
    required this.isConfirmed,
    
  });

  factory OrderServiceDetails.fromJson(Map<String, dynamic> json) {
    return OrderServiceDetails(
      id: json['id'],
      price: json['price'],
      isConfirmed: json['isConfirmed'],
      
    );
  }
}


