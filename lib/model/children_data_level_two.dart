
class Children_data_level_two {
  Children_data_level_two(
      this.id, 
      this.parentId, 
      this.name, 
      this.url, 
      this.isActive, 
      this.position, 
      this.level, 
      this.hasChildren);

  Children_data_level_two.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    url = json['url'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    hasChildren = json['hasChildren'];
  }
  String? id;
  String? parentId;
  String? name;
  String? url;
  String? isActive;
  String? position;
  String? level;
  int? hasChildren;

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
    return map;
  }

}