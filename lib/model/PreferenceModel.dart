class PreferenceModel {
  PreferenceModel({
    required this.status,
    required this.message,
    required this.body,
  });
  late final int status;
  late final String message;
  late final Body body;

  PreferenceModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    body = Body.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['body'] = body.toJson();
    return _data;
  }
}

class Body {
  Body({
    this.name,
    required this.profilepicture,
    required this.otp,
    required this.email,
    this.address,
    this.phoneNumber,
    this.qualification,
  });
  late final Null name;
  late final String profilepicture;
  late final String otp;
  late final String email;
  late final Null address;
  late final Null phoneNumber;
  late final Null qualification;

  Body.fromJson(Map<String, dynamic> json){
    name = null;
    profilepicture = json['profilepicture'];
    otp = json['otp'];
    email = json['email'];
    address = null;
    phoneNumber = null;
    qualification = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['profilepicture'] = profilepicture;
    _data['otp'] = otp;
    _data['email'] = email;
    _data['address'] = address;
    _data['phone_number'] = phoneNumber;
    _data['qualification'] = qualification;
    return _data;
  }
}