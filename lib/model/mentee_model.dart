/// id : 16
/// first_name : "Baddo"
/// last_name : "Olamide"
/// phone_number : "0815607973"
/// email : "user1@mailinator.com"
/// user_type : "USER"
/// verify_email : 1

class MenteeModel {
  MenteeModel({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? phoneNumber, 
      String? email, 
      String? userType, 
      int? verifyEmail,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _email = email;
    _userType = userType;
    _verifyEmail = verifyEmail;
}

  MenteeModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phoneNumber = json['phone_number'];
    _email = json['email'];
    _userType = json['user_type'];
    _verifyEmail = json['verify_email'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _email;
  String? _userType;
  int? _verifyEmail;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get userType => _userType;
  int? get verifyEmail => _verifyEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone_number'] = _phoneNumber;
    map['email'] = _email;
    map['user_type'] = _userType;
    map['verify_email'] = _verifyEmail;
    return map;
  }

}