class PendingPoModel {
  String? projectId;
  String? projectName;
  String? supplierName;
  String? poDate;
  String? deliveryDate;

  PendingPoModel({
    required this.projectId,
    required this.projectName,
    required this.supplierName,
    required this.poDate,
    required this.deliveryDate,
  });

  PendingPoModel.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    supplierName = json['supplierName'];
    poDate = json['poDate'];
    deliveryDate = json['deliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = projectId;
    data['projectName'] = projectName;
    data['supplierName'] = supplierName;
    data['poDate'] = poDate;
    data['deliveryDate'] = deliveryDate;
    return data;
  }
}
