
class SessionUser {
  bool status;
  String message;
  Data data;
  String token;

  SessionUser({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  SessionUser copyWith({
    bool? status,
    String? message,
    Data? data,
    String? token,
  }) =>
      SessionUser(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        token: token ?? this.token,
      );

  factory SessionUser.fromJson(Map<String, dynamic> json) => SessionUser(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "token": token,
  };
}

class Data {
  Student user;

  Data({
    required this.user,
  });

  Data copyWith({
    Student? user,
  }) =>
      Data(
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: Student.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class Student {
  CourseInfo courseInfo;
  Biodata biodata;
  String id;
  String firstname;
  String surname;
  String othername;
  String email;
  int phoneNumber;
  int matricnumber;
  String universityId;
  String university;
  String levelId;
  String level;
  String courseId;
  dynamic store;
  String role;
  bool verifiedEmail;
  int v;
  String userId;

  Student({
    required this.courseInfo,
    required this.biodata,
    required this.id,
    required this.firstname,
    required this.surname,
    required this.othername,
    required this.email,
    required this.phoneNumber,
    required this.matricnumber,
    required this.universityId,
    required this.university,
    required this.levelId,
    required this.level,
    required this.courseId,
    required this.store,
    required this.role,
    required this.verifiedEmail,
    required this.v,
    required this.userId,
  });

  Student copyWith({
    CourseInfo? courseInfo,
    Biodata? biodata,
    String? id,
    String? firstname,
    String? surname,
    String? othername,
    String? email,
    int? phoneNumber,
    int? matricnumber,
    String? universityId,
    String? university,
    String? levelId,
    String? level,
    String? courseId,
    dynamic store,
    String? role,
    bool? verifiedEmail,
    int? v,
    String? userId,
  }) =>
      Student(
        courseInfo: courseInfo ?? this.courseInfo,
        biodata: biodata ?? this.biodata,
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        surname: surname ?? this.surname,
        othername: othername ?? this.othername,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        matricnumber: matricnumber ?? this.matricnumber,
        universityId: universityId ?? this.universityId,
        university: university ?? this.university,
        levelId: levelId ?? this.levelId,
        level: level ?? this.level,
        courseId: courseId ?? this.courseId,
        store: store ?? this.store,
        role: role ?? this.role,
        verifiedEmail: verifiedEmail ?? this.verifiedEmail,
        v: v ?? this.v,
        userId: userId ?? this.userId,
      );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    courseInfo: CourseInfo.fromJson(json["courseInfo"]),
    biodata: Biodata.fromJson(json["biodata"]),
    id: json["_id"]??'N/A',
    firstname: json["firstname"]??'N/A',
    surname: json["surname"]??'N/A',
    othername: json["othername"]??'N/A',
    email: json["email"]??'N/A',
    phoneNumber: json["phoneNumber"]??'N/A',
    matricnumber: json["matricnumber"]??'N/A',
    universityId: json["universityId"]??'N/A',
    university: json["university"]??'N/A',
    levelId: json["levelId"]??'N/A',
    level: json["level"]??'N/A',
    courseId: json["courseId"]??'N/A',
    store: json["store"]??'N/A',
    role: json["role"]??'N/A',
    verifiedEmail: json["verifiedEmail"]??false,
    v: json["__v"]??'N/A',
    userId: json["id"]??'N/A',
  );

  Map<String, dynamic> toJson() => {
    "courseInfo": courseInfo.toJson(),
    "biodata": biodata.toJson(),
    "_id": id,
    "firstname": firstname,
    "surname": surname,
    "othername": othername,
    "email": email,
    "phoneNumber": phoneNumber,
    "matricnumber": matricnumber,
    "universityId": universityId,
    "university": university,
    "levelId": levelId,
    "level": level,
    "courseId": courseId,
    "store": store,
    "role": role,
    "verifiedEmail": verifiedEmail,
    "__v": v,
    "id": userId,
  };

  bool isHoc (){
    return role.toLowerCase() == 'hoc';
  }

}


class Biodata {
  String homeAddress;
  String postalCode;
  String fathername;
  String mothername;

  Biodata({
    required this.homeAddress,
    required this.postalCode,
    required this.fathername,
    required this.mothername,
  });

  Biodata copyWith({
    String? homeAddress,
    String? postalCode,
    String? fathername,
    String? mothername,
  }) =>
      Biodata(
        homeAddress: homeAddress ?? this.homeAddress,
        postalCode: postalCode ?? this.postalCode,
        fathername: fathername ?? this.fathername,
        mothername: mothername ?? this.mothername,
      );

  factory Biodata.fromJson(Map<String, dynamic> json) => Biodata(
    homeAddress: json["homeAddress"]??'N/A',
    postalCode: json["postalCode"]??'N/A',
    fathername: json["fathername"]??'N/A',
    mothername: json["mothername"]??'N/A',
  );

  Map<String, dynamic> toJson() => {
    "homeAddress": homeAddress,
    "postalCode": postalCode,
    "fathername": fathername,
    "mothername": mothername,
  };
}

class CourseInfo {
  String faculty;
  String course;

  CourseInfo({
    required this.faculty,
    required this.course,
  });

  CourseInfo copyWith({
    String? faculty,
    String? course,
  }) =>
      CourseInfo(
        faculty: faculty ?? this.faculty,
        course: course ?? this.course,
      );

  factory CourseInfo.fromJson(Map<String, dynamic> json) => CourseInfo(
    faculty: json["faculty"]??'N/A',
    course: json["course"]??'N/A',
  );

  Map<String, dynamic> toJson() => {
    "faculty": faculty,
    "course": course,
  };
}
