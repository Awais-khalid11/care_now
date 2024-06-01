class User{
  String id,phone,countryCode;
  String? imageUrl,notificationToken,name,gender,address,bloodGroup,userType,depressionLevel,anxietyDisorderLevel,generalizedAnxiety,panicDisorder;
  int timeStamp,lastDonation;
  double latitude,longitude;
  bool block;

//<editor-fold desc="Data Methods">
  User({
    required this.id,
    required this.phone,
    required this.countryCode,
    this.imageUrl,
    this.notificationToken,
    this.name,
    this.gender,
    this.address,
    this.bloodGroup,
    this.userType,
    this.depressionLevel,
    this.anxietyDisorderLevel,
    this.generalizedAnxiety,
    this.panicDisorder,
    required this.timeStamp,
    required this.lastDonation,
    required this.latitude,
    required this.longitude,
    required this.block,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          phone == other.phone &&
          countryCode == other.countryCode &&
          imageUrl == other.imageUrl &&
          notificationToken == other.notificationToken &&
          name == other.name &&
          gender == other.gender &&
          address == other.address &&
          bloodGroup == other.bloodGroup &&
          userType == other.userType &&
          depressionLevel == other.depressionLevel &&
          anxietyDisorderLevel == other.anxietyDisorderLevel &&
          generalizedAnxiety == other.generalizedAnxiety &&
          panicDisorder == other.panicDisorder &&
          timeStamp == other.timeStamp &&
          lastDonation == other.lastDonation &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          block == other.block);

  @override
  int get hashCode =>
      id.hashCode ^
      phone.hashCode ^
      countryCode.hashCode ^
      imageUrl.hashCode ^
      notificationToken.hashCode ^
      name.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      bloodGroup.hashCode ^
      userType.hashCode ^
      depressionLevel.hashCode ^
      anxietyDisorderLevel.hashCode ^
      generalizedAnxiety.hashCode ^
      panicDisorder.hashCode ^
      timeStamp.hashCode ^
      lastDonation.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      block.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' phone: $phone,' +
        ' countryCode: $countryCode,' +
        ' imageUrl: $imageUrl,' +
        ' notificationToken: $notificationToken,' +
        ' name: $name,' +
        ' gender: $gender,' +
        ' address: $address,' +
        ' bloodGroup: $bloodGroup,' +
        ' userType: $userType,' +
        ' depressionLevel: $depressionLevel,' +
        ' anxietyDisorderLevel: $anxietyDisorderLevel,' +
        ' generalizedAnxiety: $generalizedAnxiety,' +
        ' panicDisorder: $panicDisorder,' +
        ' timeStamp: $timeStamp,' +
        ' lastDonation: $lastDonation,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' block: $block,' +
        '}';
  }

  User copyWith({
    String? id,
    String? phone,
    String? countryCode,
    String? imageUrl,
    String? notificationToken,
    String? name,
    String? gender,
    String? address,
    String? bloodGroup,
    String? userType,
    String? depressionLevel,
    String? anxietyDisorderLevel,
    String? generalizedAnxiety,
    String? panicDisorder,
    int? timeStamp,
    int? lastDonation,
    double? latitude,
    double? longitude,
    bool? block,
  }) {
    return User(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      imageUrl: imageUrl ?? this.imageUrl,
      notificationToken: notificationToken ?? this.notificationToken,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      userType: userType ?? this.userType,
      depressionLevel: depressionLevel ?? this.depressionLevel,
      anxietyDisorderLevel: anxietyDisorderLevel ?? this.anxietyDisorderLevel,
      generalizedAnxiety: generalizedAnxiety ?? this.generalizedAnxiety,
      panicDisorder: panicDisorder ?? this.panicDisorder,
      timeStamp: timeStamp ?? this.timeStamp,
      lastDonation: lastDonation ?? this.lastDonation,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      block: block ?? this.block,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'phone': this.phone,
      'countryCode': this.countryCode,
      'imageUrl': this.imageUrl,
      'notificationToken': this.notificationToken,
      'name': this.name,
      'gender': this.gender,
      'address': this.address,
      'bloodGroup': this.bloodGroup,
      'userType': this.userType,
      'depressionLevel': this.depressionLevel,
      'anxietyDisorderLevel': this.anxietyDisorderLevel,
      'generalizedAnxiety': this.generalizedAnxiety,
      'panicDisorder': this.panicDisorder,
      'timeStamp': this.timeStamp,
      'lastDonation': this.lastDonation,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'block': this.block,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      countryCode: map['countryCode'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      notificationToken: map['notificationToken'] as String? ?? '',
      name: map['name'] as String? ?? '',
      gender: map['gender'] as String? ?? '',
      address: map['address'] as String? ?? '',
      bloodGroup: map['bloodGroup'] as String? ?? '',
      userType: map['userType'] as String? ?? '',
      depressionLevel: map['depressionLevel'] as String? ?? '',
      anxietyDisorderLevel: map['anxietyDisorderLevel'] as String?,
      generalizedAnxiety: map['generalizedAnxiety'] as String? ?? '',
      panicDisorder: map['panicDisorder'] as String? ?? '',
      timeStamp: map['timeStamp'] as int? ?? 0,
      lastDonation: map['lastDonation'] as int? ?? 0,
      latitude: map['latitude'] as double? ?? 0.0,
      longitude: map['longitude'] as double? ?? 0.0,
      block: map['block'] as bool? ?? false,
    );
  }
//</editor-fold>
}