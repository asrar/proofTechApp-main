class GetMTStockModel {
  GetMTStockModel({
    required this.data,
  });
  late final Data data;

  GetMTStockModel.fromJson(Map<String, dynamic> json){
    print("MTS 0");
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.admin_projects,
    required this.admin_materails,
    required this.admin_tools,
  });
  late final List<AdminProjects> admin_projects;
  late final List<AdminMaterails> admin_materails;
  late final List<AdminTools> admin_tools;

  Data.fromJson(Map<String, dynamic> json){
    print("MTS 1");
    admin_projects = List.from(json['projects']).map((e)=>AdminProjects.fromJson(e)).toList();
    print("MTS 2");
    admin_materails = List.from(json['materails']).map((e)=>AdminMaterails.fromJson(e)).toList();
    print("MTS 3");
    admin_tools = List.from(json['tools']).map((e)=>AdminTools.fromJson(e)).toList();
    print("MTS 4");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['projects'] = admin_projects.map((e)=>e.toJson()).toList();
    _data['materails'] = admin_materails.map((e)=>e.toJson()).toList();
    _data['tools'] = admin_tools.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AdminProjects {
  AdminProjects({
    required this.id,
    required this.projectTypeId,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String projectTypeId;
  late final String name;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  AdminProjects.fromJson(Map<String, dynamic> json){
    id = json['id'];
    projectTypeId = json['project_type_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['project_type_id'] = projectTypeId;
    _data['name'] = name;
    _data['description'] = description;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class AdminMaterails {
  AdminMaterails({
    required this.id,
    required this.materialsTypeId,
    required this.unitId,
    this.unitPackageId,
    this.perUnitPrice,
    required this.name,
    this.attention,
    required this.quantityAvailable,
    required this.availablePackageQuantity,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.unit,
    required this.admintype,
    required this.unitPacakge,
  });
  late final int id;
  late final String materialsTypeId;
  late final String unitId;
  late final String? unitPackageId;
  late final String? perUnitPrice;
  late final String name;
  late final String? attention;
  late final String quantityAvailable;
  late final String availablePackageQuantity;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final Unit unit;
  late final AdminType admintype;
  late final UnitPacakge unitPacakge;

  AdminMaterails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    materialsTypeId = json['materials_type_id'];
    unitId = json['unit_id'];
    unitPackageId = null;
    perUnitPrice = null;
    name = json['name'];
    attention = null;
    quantityAvailable = json['quantity_available'];
    availablePackageQuantity = json['available_package_quantity'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unit = Unit.fromJson(json['unit']);
    admintype = AdminType.fromJson(json['type']);
    unitPacakge = UnitPacakge.fromJson(json['unit_pacakge']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['materials_type_id'] = materialsTypeId;
    _data['unit_id'] = unitId;
    _data['unit_package_id'] = unitPackageId;
    _data['per_unit_price'] = perUnitPrice;
    _data['name'] = name;
    _data['attention'] = attention;
    _data['quantity_available'] = quantityAvailable;
    _data['available_package_quantity'] = availablePackageQuantity;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['unit'] = unit.toJson();
    _data['type'] = admintype.toJson();
    _data['unit_pacakge'] = unitPacakge;
    return _data;
  }
}

class Unit {
  Unit({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String title;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    print("MTS A ");
    id = json['id'];
    title = json['title'];
    print("MTS B ");
    status = json['status'];
    print("MTS C ");
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print("MTS D ");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class AdminType {
  AdminType({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  AdminType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class UnitPacakge {
  UnitPacakge({
    required this.id,
    required this.title,
    required this.quantity,
    required this.status,
  });
  late final int id;
  late final String title;
  late final String quantity;
  late final String status;

  UnitPacakge.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['quantity'] = quantity;
    _data['status'] = status;
    return _data;
  }
}

class AdminTools {
  AdminTools({
    required this.id,
    required this.toolsTypeId,
    required this.unitId,
    this.perUnitPrice,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.availableStock,
    required this.unit,
    required this.admintooltype,
  });
  late final int id;
  late final String toolsTypeId;
  late final String unitId;
  late final String? perUnitPrice;
  late final String name;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String? availableStock;
  late final Unit unit;
  late final AdminToolType admintooltype;

  AdminTools.fromJson(Map<String, dynamic> json){
    print("MTS 5");
    id = json['id'];
    toolsTypeId = json['tools_type_id'];
    unitId = json['unit_id'];
    perUnitPrice = null;
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print("MTS 6");
    print("6 - name: $name");
    print("6 - available Stock: ${json['availableStock']}");
    if(json['availableStock']==0) {

    }else{
      availableStock = json['availableStock'];
    }

    unit = Unit.fromJson(json['unit']);
    print("MTS 7");
    admintooltype = AdminToolType.fromJson(json['type']);
    print("MTS 8");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tools_type_id'] = toolsTypeId;
    _data['unit_id'] = unitId;
    _data['per_unit_price'] = perUnitPrice;
    _data['name'] = name;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['availableStock'] = availableStock;
    _data['unit'] = unit.toJson();
    _data['type'] = admintooltype.toJson();
    return _data;
  }


}
class AdminToolType {
  AdminToolType({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  AdminToolType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}