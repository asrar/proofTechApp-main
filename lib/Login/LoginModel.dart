class LoginModel {
  LoginModel({

    required this.logsKey,
    required this.data,
  });

  late final List<String> logsKey;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json){

    logsKey = List.castFrom<dynamic, String>(json['logs_key']);
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['logs_key'] = logsKey;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.zoneId,
    required this.authToken,
    required this.Projects1,
  });
  late final int id;
  late final String fName;
  late final String lName;
  late final String phone;
  late final String email;
  late final String image;
  late final String password;
  late final String? rememberToken;
  late final String createdAt;
  late final String updatedAt;
  late final String roleId;
  late final String? zoneId;
  late final String authToken;
  late final List<Projects> Projects1;

  Data.fromJson(Map<String, dynamic> json){
    print("parsing data now");
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    password = json['password'];

    rememberToken = json['remember_token'];;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
    zoneId = json['zone_id'];
    authToken = json['auth_token'];
    print("parsing 2.0");
    Projects1 = List.from(json['Projects']).map((e)=>Projects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['f_name'] = fName;
    _data['l_name'] = lName;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['image'] = image;
    _data['password'] = password;
    _data['remember_token'] = rememberToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['role_id'] = roleId;
    _data['zone_id'] = zoneId;
    _data['auth_token'] = authToken;
    _data['Projects'] = Projects1.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Projects {
  Projects({
    required this.id,
    required this.projectTypeId,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.material,
    required this.tools,
    required this.team,
    required this.type,
    required this.expenses1,
    required this.actions1,

  });
  late final int id;
  late final String projectTypeId;
  late final String name;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final List<Materials> material;
  late final List<Tools> tools;
  late final List<Team> team;
  late final Type type;
  late final List<Expenses1> expenses1;
  late final List<Actions1> actions1;

  Projects.fromJson(Map<String, dynamic> json){
    print("- parsing project 1.0");
    id = json['id'];
    projectTypeId = json['project_type_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    print("- parsing project 1.0 A");
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print("- parsing project 1.0 B");
    material = List.from(json['material']).map((e)=>Materials.fromJson(e)).toList();
    print("- parsing project 1.1");
    tools = List.from(json['tools']).map((e)=>Tools.fromJson(e)).toList();
    print("- parsing project 1.2");
    team = List.from(json['team']).map((e)=>Team.fromJson(e)).toList();
    print("- parsing project 1.3");
    expenses1 = List.from(json['expenses1']).map((e)=>Expenses1.fromJson(e)).toList();
    print("- parsing project 1.4");
    actions1 = List.from(json['actions1']).map((e)=>Actions1.fromJson(e)).toList();
    print("- parsing project 1.5");
    type = Type.fromJson(json['type']);
    print("- parsing project 2.0");
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
    _data['tool'] = material.map((e)=>e.toJson()).toList();
    _data['tools'] = tools.map((e)=>e.toJson()).toList();
    _data['team'] = team.map((e)=>e.toJson()).toList();
    _data['expenses1'] = expenses1.map((e)=>e.toJson()).toList();
    _data['actions1'] = actions1.map((e)=>e.toJson()).toList();
    _data['type'] = type.toJson();
    return _data;
  }
}

class Materials {
  Materials({
    required this.id,
    required this.name,
    required this.projectId,
    required this.unitTitle,
    required this.stock,
  });
  late final int id;
  late final String name;
  late final String projectId;
  late final String unitTitle;
  late final List<Stock> stock;

  Materials.fromJson(Map<String, dynamic> json){
    print("Starting material parsing ");
    id = json['id'];
    name = json['name'];
    projectId = json['project_id'];
    unitTitle = json['unit_title'];
    stock = List.from(json['stock']).map((e)=>Stock.fromJson(e)).toList();
    print("ending Materials parsing ");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['project_id'] = projectId;
    _data['unit_title'] = unitTitle;
    _data['stock'] = stock.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Stock {
  Stock({
    required this.id,
    required this.materialsId,
    required this.projectId,
    required this.receivedFrom,
    required this.receivedTo,
    required this.quantity,
    required this.packageQuantity,
    required this.unitPackageId,
    required this.unit,
    required this.notes,
    required this.unitpacakge,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String materialsId;
  late final String projectId;
  late final String receivedFrom;
  late final String receivedTo;
  late final String quantity;
  String? packageQuantity;
  late final String unitPackageId;
  late final String? unit;
  late final String notes;
  late final String createdAt;
  late final String updatedAt;
   Unitpacakge? unitpacakge;

  Stock.fromJson(Map<String, dynamic> json){
    print("Starting Stock parsing ");
    id = json['id'];
    if(json['materials_id'] != null ) {
      materialsId = json['materials_id'];
    }else if(json['tools_id'] != null){
      materialsId = json['tools_id'];
    }
    print("-- before quantity 11");
    projectId = json['project_id'];
    if(json['received_from']!=null) {
      receivedFrom = json['received_from'];
    }
    if(json['received_to']!=null) {
      receivedTo = json['received_to'];
    }


    quantity = json['quantity'];
    print("-- before quantity");
    if(json['package_quantity']!=null) {
      packageQuantity = json['package_quantity'];
    }
    if(json['unit_package_id']!=null) {
      unitPackageId = json['unit_package_id'];
    }


    print("before unit - inside stock");
    if(json['unit']!=null){
      unit = json['unit'];
    }
    print("before unit - inside stock 0 ");
    if(json['notes']!=null) {
      notes = json['notes'];
    }
    print("before unit - inside stock 1");
    if(json['created_at'] !=null) {
      createdAt = json['created_at'];
    } print("before unit - inside stock 2");
    if(json['updated_at']!=null) {
      updatedAt = json['updated_at'];
    }
    print("End Stock parsing ");
    print(" just before unit - inside stock");
    if(json['unitpacakge']!=null) {
      unitpacakge = Unitpacakge.fromJson(json['unitpacakge']);
      print("end unit - inside stock");
    }
  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;

    _data['materials_id'] = materialsId;
    _data['project_id'] = projectId;
    _data['received_from'] = receivedFrom;
    _data['received_to'] = receivedTo;
    _data['quantity'] = quantity;
    _data['package_quantity'] = packageQuantity;
    _data['unit_package_id'] = unitPackageId;
    _data['unit'] = unit;
    _data['notes'] = notes;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Unitpacakge {
  Unitpacakge({
    required this.id,
    required this.title,
    required this.status,
  });
  late final int id;
  late final String title;
  late final String status;

  Unitpacakge.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    return _data;
  }
}

class Tools {
  Tools({
    required this.id,
    required this.name,
    required this.projectId,
    required this.unitTitle,
    required this.stock,
  });
  late final int id;
  late final String name;
  late final String projectId;
  late final String unitTitle;
  late final List<Stock> stock;

  Tools.fromJson(Map<String, dynamic> json){
    print("Starting tools parsing ");
    id = json['id'];
    name = json['name'];
    projectId = json['project_id'];
    unitTitle = json['unit_title'];
    stock = List.from(json['stock']).map((e)=>Stock.fromJson(e)).toList();
    print("ending tools parsing ");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['project_id'] = projectId;
    _data['unit_title'] = unitTitle;
    _data['stock'] = stock.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Team {
  Team({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.zoneId,
    required this.authToken,
    required this.memberAddingTime,
  });
  late final int id;
  late final String fName;
  late final String lName;
  late final String phone;
  late final String email;
  late final String image;
  late final String password;
  late final String? rememberToken;
  late final String createdAt;
  late final String updatedAt;
  late final String roleId;
  late final String? zoneId;
  late final String? authToken;
  late final String memberAddingTime;

  Team.fromJson(Map<String, dynamic> json){
    print("--starting team parsing >>> ");
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    print("-- team name are ${fName} - ${lName}");
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    print("--mid team parsing ");
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
    zoneId = json['zone_id'];
    authToken = json['auth_token'];
    memberAddingTime = json['member_adding_time'];

    print("--ending team parsing ");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['f_name'] = fName;
    _data['l_name'] = lName;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['image'] = image;
    _data['password'] = password;
    _data['remember_token'] = rememberToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['role_id'] = roleId;
    _data['zone_id'] = zoneId;
    _data['auth_token'] = authToken;
    _data['member_adding_time'] = memberAddingTime;
    return _data;
  }
}
class Expenses1 {
  Expenses1({
    required this.id,
    required this.userId,
    required this.projectId,
    required this.title,
    required this.reason,
    required this.cost,
    required this.detail,
    required this.fName,
    required this.lName,
  });
  late final int id;
  late final String userId;
  late final String projectId;
  late final String title;
  late final String reason;
  late final String cost;
  late final String detail;
  late final String fName;
  late final String lName;

  Expenses1.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    title = json['title'];
    reason = json['reason'];
    cost = json['cost'];
    detail = json['detail'];
    fName = json['f_name'];
    lName = json['l_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['project_id'] = projectId;
    _data['title'] = title;
    _data['reason'] = reason;
    _data['cost'] = cost;
    _data['detail'] = detail;
    _data['f_name'] = fName;
    _data['l_name'] = lName;
    return _data;
  }
}

class Actions1 {
  Actions1({
    required this.id,
    required this.userId,
    required this.projectId,
    required this.title,
    required this.reason,
    required this.detail,
    required this.fName,
    required this.lName,
  });
  late final int id;
  late final String userId;
  late final String projectId;
  late final String title;
  late final String reason;
  late final String detail;
  late final String fName;
  late final String lName;

  Actions1.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    title = json['title'];
    reason = json['reason'];
    detail = json['detail'];
    fName = json['f_name'];
    lName = json['l_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['project_id'] = projectId;
    _data['title'] = title;
    _data['reason'] = reason;
    _data['detail'] = detail;
    _data['f_name'] = fName;
    _data['l_name'] = lName;
    return _data;
  }
}

class Type {
  Type({
    required this.id,
    required this.name,
    required this.activities,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.myActivities,
  });
  late final int id;
  late final String name;
  late final List<String> activities;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final List<String> myActivities;

  Type.fromJson(Map<String, dynamic> json){

    print("Starting Type parsing ");
    id = json['id'];
    name = json['name'];
    activities = List.castFrom<dynamic, String>(json['activities']);
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    myActivities = List.castFrom<dynamic, String>(json['myActivities']);

    print("ENding Type parsing ");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['activities'] = activities;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['myActivities'] = myActivities;
    return _data;
  }
}