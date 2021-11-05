import 'package:cartswing/model/categories.dart';
import 'package:cartswing/model/links.dart';

class Data {
  Data(
      this.links, 
      this.categories);

  Data.fromJson(dynamic json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
  Links? links;
  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (links != null) {
      map['links'] = links!.toJson();
    }
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}