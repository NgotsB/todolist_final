class User {
  int? id;
  String? picture;
  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  String? region;
  String? province;
  String? zipCode;
  String? city;
  String? barangay;
  String? street;
  String? address;
  String? role;
  DateTime? emailVerifiedAt;
  bool? smsNotification;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.picture,
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.phone,
    this.region,
    this.province,
    this.zipCode,
    this.city,
    this.barangay,
    this.street,
    this.address,
    this.role,
    this.emailVerifiedAt,
    this.smsNotification,
    this.deleted,
    this.createdAt,
    this.updatedAt
  });

  get completeName {
    String mName = middleName != "" ? '$middleName ' : '';
    return '$firstName $mName $lastName';
  }

  get completeAddress {
    return '$address, $street, $barangay, $city, $zipCode, $province, $region, Philippines';
  }

  get shortAddress {
    return '$address, $street, $barangay, $city';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      picture: json['picture'],
      username: json['username'] ?? "",
      firstName: json['firstname'],
      middleName: json['middlename'] ?? "",
      lastName: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      region: json['region'] ?? "",
      province: json['province'] ?? "",
      zipCode: json['zip_code'] ?? "",
      city: json['city'] ?? "",
      barangay: json['barangay'] ?? "",
      street: json['street'] ?? "",
      address: json['address'] ?? "",
      role: json['role'],
      emailVerifiedAt: json['email_verified_at'] != null ?
      DateTime.parse(json["email_verified_at"]) : DateTime.now(),
      smsNotification: (json['sms_notification'] == 1),
      deleted: (json['deleted'] == 1),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}

