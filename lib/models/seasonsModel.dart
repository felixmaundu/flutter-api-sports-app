// ignore_for_file: file_names

class SeasonsModel {
  String? get;

  int? results;
  Paging? paging;
  List<int>? response;

  SeasonsModel({this.get, this.results, this.paging, this.response});

  SeasonsModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];

    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'].cast<int>();
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
