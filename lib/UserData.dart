class UserData {
  String? mobile;
  String? deg;

  UserData({this.mobile, this.deg});

  UserData.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['deg'] = this.deg;
    return data;
  }
}