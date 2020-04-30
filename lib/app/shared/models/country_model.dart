import 'package:hive/hive.dart';

part 'country_model.g.dart';

@HiveType(typeId: 0)
class CountryModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String code;

  CountryModel({this.name, this.code});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'].toString().toLowerCase();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}