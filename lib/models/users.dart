class UserData {
  Data? data;

  UserData({this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<User>? user;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;
  Data(
      {this.currentPage,
      this.user,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      user = <User>[];
      json['data'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.user != null) {
      data['data'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;

    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? joinDate;
  String? dateOfBirth;
  int? designationId;
  String? gender;
  int? mobile;
  int? landline;
  String? email;
  String? presentAddress;
  String? permanentAddress;
  String? profilePicture;
  String? resume;
  String? createdAt;
  String? updatedAt;
  String? status;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.joinDate,
      this.dateOfBirth,
      this.designationId,
      this.gender,
      this.mobile,
      this.landline,
      this.email,
      this.presentAddress,
      this.permanentAddress,
      this.profilePicture,
      this.resume,
      this.createdAt,
      this.updatedAt,
      this.status});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    joinDate = json['join_date'];
    dateOfBirth = json['date_of_birth'];
    designationId = json['designation_id'];
    gender = json['gender'];
    mobile = json['mobile'];
    landline = json['landline'];
    email = json['email'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    profilePicture = json['profile_picture'];
    resume = json['resume'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['id'] = this.id;
    user['first_name'] = this.firstName;
    user['last_name'] = this.lastName;
    user['join_date'] = this.joinDate;
    user['date_of_birth'] = this.dateOfBirth;
    user['designation_id'] = this.designationId;
    user['gender'] = this.gender;
    user['mobile'] = this.mobile;
    user['landline'] = this.landline;
    user['email'] = this.email;
    user['present_address'] = this.presentAddress;
    user['permanent_address'] = this.permanentAddress;
    user['profile_picture'] = this.profilePicture;
    user['resume'] = this.resume;
    user['created_at'] = this.createdAt;
    user['updated_at'] = this.updatedAt;
    user['status'] = this.status;
    return user;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
