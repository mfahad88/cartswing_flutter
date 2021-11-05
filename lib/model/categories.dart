
import 'children_data_level_one.dart';

class Categories {
  Categories(
      this.id, 
      this.parentId, 
      this.name, 
      this.url, 
      this.isActive, 
      this.position, 
      this.level, 
      this.hasChildren, 
      this.childrenDataLevelOne);

  Categories.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    url = json['url'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    hasChildren = json['hasChildren'];
    if (json['children_data_level_one'] != null) {
      childrenDataLevelOne = [];
      json['children_data_level_one'].forEach((v) {
        childrenDataLevelOne!.add(Children_data_level_one.fromJson(v));
      });
    }
  }
  String? id;
  int? parentId;
  String? name;
  String? url;
  String? isActive;
  String? position;
  String? level;
  int? hasChildren;
  List<Children_data_level_one>? childrenDataLevelOne;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_id'] = parentId;
    map['name'] = name;
    map['url'] = url;
    map['is_active'] = isActive;
    map['position'] = position;
    map['level'] = level;
    map['hasChildren'] = hasChildren;
    if (childrenDataLevelOne != null) {
      map['children_data_level_one'] = childrenDataLevelOne!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}