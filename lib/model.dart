class Model {
  String? name;
  String? roll;

  Model({this.name, this.roll});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roll'] = this.roll;
    return data;
  }
}