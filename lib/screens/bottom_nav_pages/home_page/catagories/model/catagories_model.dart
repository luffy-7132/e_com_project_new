class CatagoriesModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  List<Childes>? childes;

  CatagoriesModel(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.parentId,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.homeStatus,
      this.priority,
      this.childes});

  CatagoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((v) {
        childes!.add(new Childes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home_status'] = this.homeStatus;
    data['priority'] = this.priority;
    if (this.childes != null) {
      data['childes'] = this.childes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childes {
  int? id;
  String? name;
  String? slug;
  Null? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  List<Childes>? childes;

  Childes(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.parentId,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.homeStatus,
      this.priority,
      this.childes});

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((v) {
        childes!.add(new Childes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home_status'] = this.homeStatus;
    data['priority'] = this.priority;
    if (this.childes != null) {
      data['childes'] = this.childes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
