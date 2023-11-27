class TimeZoneModel {
  String? get;

  int? results;
  Paging? paging;
  List<String>? response;

  TimeZoneModel({this.get, this.results, this.paging, this.response});

  TimeZoneModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];

    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;

    data['results'] = results;
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    data['response'] = response;
    return data;
  }
}

class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['total'] = total;
    return data;
  }
}
