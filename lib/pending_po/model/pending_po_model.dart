class PendingPoModel {
  String? poCode;
  String? projectName;
  String? supplierName;
  String? poDate;
  String? deliveryDate;

  PendingPoModel({
    required this.poCode,
    required this.projectName,
    required this.supplierName,
    required this.poDate,
    required this.deliveryDate,
  });

  PendingPoModel.fromJson(Map<String, dynamic> json) {
    poCode = json['projectId'];
    projectName = json['projectName'];
    supplierName = json['supplierName'];
    poDate = json['poDate'];
    deliveryDate = json['deliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = poCode;
    data['projectName'] = projectName;
    data['supplierName'] = supplierName;
    data['poDate'] = poDate;
    data['deliveryDate'] = deliveryDate;
    return data;
  }
}
