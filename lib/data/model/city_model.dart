class CityModel {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CityModel(
      {this.name,
        this.localNames,
        this.lat,
        this.lon,
        this.country,
        this.state});

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? new LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.localNames != null) {
      data['local_names'] = this.localNames!.toJson();
    }
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['state'] = this.state;
    return data;
  }
}

class LocalNames {
  String? de;
  String? fr;
  String? ascii;
  String? es;
  String? featureName;
  String? zh;
  String? et;
  String? ja;
  String? my;
  String? ru;
  String? en;

  LocalNames(
      {this.de,
        this.fr,
        this.ascii,
        this.es,
        this.featureName,
        this.zh,
        this.et,
        this.ja,
        this.my,
        this.ru,
        this.en});

  LocalNames.fromJson(Map<String, dynamic> json) {
    de = json['de'];
    fr = json['fr'];
    ascii = json['ascii'];
    es = json['es'];
    featureName = json['feature_name'];
    zh = json['zh'];
    et = json['et'];
    ja = json['ja'];
    my = json['my'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['de'] = this.de;
    data['fr'] = this.fr;
    data['ascii'] = this.ascii;
    data['es'] = this.es;
    data['feature_name'] = this.featureName;
    data['zh'] = this.zh;
    data['et'] = this.et;
    data['ja'] = this.ja;
    data['my'] = this.my;
    data['ru'] = this.ru;
    data['en'] = this.en;
    return data;
  }
}
