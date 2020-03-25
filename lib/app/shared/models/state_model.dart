class StateModel {
  String state;
  String code;
  String suspect;
  String confirmed;
  String recovered;
  String death;

  StateModel(
      {this.state,
      this.code,
      this.suspect,
      this.confirmed,
      this.recovered,
      this.death});

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    code = json['code'];
    suspect = json['suspect'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    death = json['death'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['code'] = this.code;
    data['suspect'] = this.suspect;
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['death'] = this.death;
    return data;
  }
}
