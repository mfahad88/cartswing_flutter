

import 'package:cartswing/model/children_data_level_two.dart';

class Children_data_level_one {
  Children_data_level_one(
      this.id, 
      this.parentId, 
      this.name, 
      this.url, 
      this.isActive, 
      this.position, 
      this.level, 
      this.hasChildren, 
      this.childrenDataLevelTwo);

  Children_data_level_one.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    url = json['url'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    hasChildren = json['hasChildren'];
    if (json['children_data'] != null) {
      childrenDataLevelTwo = [];
      json['children_data'].forEach((v) {
        childrenDataLevelTwo!.add(Children_data_level_two.fromJson(v));
      });
    }
  }
  String? id;
  String? parentId;
  String? name;
  String? url;
  String? isActive;
  String? position;
  String? level;
  int? hasChildren;
  List<Children_data_level_two>? childrenDataLevelTwo;

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
    if (childrenDataLevelTwo != null) {
      map['children_data'] = childrenDataLevelTwo!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}