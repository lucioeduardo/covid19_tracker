class StateModel {
  int confirmed;
  int deaths;
  String state;

  StateModel({this.confirmed, this.deaths, this.state});

  StateModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['state'] = this.state;
    return data;
  }
}