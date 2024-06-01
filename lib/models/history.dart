import 'package:get/get.dart';

class History {
  String id,receiverName,age,reason,quantity,bloodGroup,gender,address,userId;
  int timeStamp,date;

//<editor-fold desc="Data Methods">
  History({
    required this.id,
    required this.receiverName,
    required this.age,
    required this.reason,
    required this.quantity,
    required this.bloodGroup,
    required this.gender,
    required this.address,
    required this.userId,
    required this.timeStamp,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is History &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          receiverName == other.receiverName &&
          age == other.age &&
          reason == other.reason &&
          quantity == other.quantity &&
          bloodGroup == other.bloodGroup &&
          gender == other.gender &&
          address == other.address &&
          userId == other.userId &&
          timeStamp == other.timeStamp &&
          date == other.date);

  @override
  int get hashCode =>
      id.hashCode ^
      receiverName.hashCode ^
      age.hashCode ^
      reason.hashCode ^
      quantity.hashCode ^
      bloodGroup.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      userId.hashCode ^
      timeStamp.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'History{' +
        ' id: $id,' +
        ' receiverName: $receiverName,' +
        ' age: $age,' +
        ' reason: $reason,' +
        ' quantity: $quantity,' +
        ' bloodGroup: $bloodGroup,' +
        ' gender: $gender,' +
        ' address: $address,' +
        ' userId: $userId,' +
        ' timeStamp: $timeStamp,' +
        ' date: $date,' +
        '}';
  }

  History copyWith({
    String? id,
    String? receiverName,
    String? age,
    String? reason,
    String? quantity,
    String? bloodGroup,
    String? gender,
    String? address,
    String? userId,
    int? timeStamp,
    int? date,
  }) {
    return History(
      id: id ?? this.id,
      receiverName: receiverName ?? this.receiverName,
      age: age ?? this.age,
      reason: reason ?? this.reason,
      quantity: quantity ?? this.quantity,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      userId: userId ?? this.userId,
      timeStamp: timeStamp ?? this.timeStamp,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'receiverName': this.receiverName,
      'age': this.age,
      'reason': this.reason,
      'quantity': this.quantity,
      'bloodGroup': this.bloodGroup,
      'gender': this.gender,
      'address': this.address,
      'userId': this.userId,
      'timeStamp': this.timeStamp,
      'date': this.date,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'] as String,
      receiverName: map['receiverName'] as String,
      age: map['age'] as String,
      reason: map['reason'] as String,
      quantity: map['quantity'] as String,
      bloodGroup: map['bloodGroup'] as String,
      gender: map['gender'] as String,
      address: map['address'] as String,
      userId: map['userId'] as String,
      timeStamp: map['timeStamp'] as int,
      date: map['date'] as int,
    );
  }

//</editor-fold>
}