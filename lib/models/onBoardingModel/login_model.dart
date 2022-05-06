class LoginModel {
  late String message;
  late UserData? data;
  late bool status;
  LoginModel.fromJason(Map<String, dynamic> jsonData) {
    message = jsonData['message'];
    data =
        jsonData['data'] != null ? UserData.fromJason(jsonData['data']) : null;
    status = jsonData['status'];
  }
}

class UserData {
  late int id;
  late int points;
  late int credit;
  late String name;
  late String email;
  late String phone;
  late String image;
  String? token;
  UserData.fromJason(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    name = jsonData['name'];
    token = jsonData['token'];
    email = jsonData['email'];
    image = jsonData['image'];
    credit = jsonData['credit'];
    phone = jsonData['phone'];
    points = jsonData['points'];
  }
}
