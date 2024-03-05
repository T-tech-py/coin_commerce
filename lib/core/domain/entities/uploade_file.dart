
class UploadFileResponse {
  FileClass? file;
  String? uploadUrl;

  UploadFileResponse({
    this.file,
    this.uploadUrl,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => UploadFileResponse(
    file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
    uploadUrl: json["uploadUrl"],
  );

  Map<String, dynamic> toJson() => {
    "file": file?.toJson(),
    "uploadUrl": uploadUrl,
  };
}

class FileClass {
  int? id;
  String? key;
  dynamic host;
  dynamic type;
  String? url;
  bool? secure;
  dynamic mimetype;
  bool? processing;
  DateTime? createdAt;
  DateTime? updatedAt;

  FileClass({
    this.id,
    this.key,
    this.host,
    this.type,
    this.url,
    this.secure,
    this.mimetype,
    this.processing,
    this.createdAt,
    this.updatedAt,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
    id: json["id"],
    key: json["key"],
    host: json["host"],
    type: json["type"],
    url: json["url"],
    secure: json["secure"],
    mimetype: json["mimetype"],
    processing: json["processing"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "host": host,
    "type": type,
    "url": url,
    "secure": secure,
    "mimetype": mimetype,
    "processing": processing,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
