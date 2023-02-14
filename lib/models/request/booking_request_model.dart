
class BookingRequestModel{

   BookingRequestModel({
    required this.date,
    required this.carId,
    required this.userId,
    required this.intendedTime,
    required this.intendedMinutes,
  });

  String date;
  int carId;
  int userId;
  String intendedTime;
  int intendedMinutes;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      date: json['date'],
      carId: json['carId'],
      userId: json['userId'],
      intendedTime: json['intendedTime'],
      intendedMinutes: json['intendedMinutes'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'carId': carId,
        'userId': userId,
        'intendedTime': intendedTime,
        'intendedMinutes': intendedMinutes,
      };
}