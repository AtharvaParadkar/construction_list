class PendingPoModel {
  PendingPoModel({
    required this.isSuccess,
    required this.data,
    this.errorList,
    required this.message,
  });

  late final bool isSuccess;
  late final Data? data;
  late final Null errorList;
  late final String message;

  PendingPoModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorList = null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['data'] = data?.toJson();
    _data['errorList'] = errorList;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.response,
  });

  late final List<PendingPoItemModel>? response;

  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? List.from(json['response'])
            .map((e) => PendingPoItemModel.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['response'] = response?.map((e) => e.toJson()).toList();
    return data;
  }
}

class PendingPoItemModel {
  String? poCode;
  String? projectName;
  String? supplierName;
  String? poDate;
  String? deliveryDate;

  PendingPoItemModel({
    required this.poCode,
    required this.projectName,
    required this.supplierName,
    required this.poDate,
    required this.deliveryDate,
  });

  PendingPoItemModel.fromJson(Map<String, dynamic> json) {
    poCode = json['poCode'];
    projectName = json['projectName'];
    supplierName = json['supplierName'];
    poDate = json['poDate'];
    deliveryDate = json['deliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poCode'] = poCode;
    data['projectName'] = projectName;
    data['supplierName'] = supplierName;
    data['poDate'] = poDate;
    data['deliveryDate'] = deliveryDate;
    return data;
  }
}
