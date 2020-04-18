class HistoricalModel {
  DateTime date;
  int value;

  HistoricalModel({this.date, this.value});

  HistoricalModel.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date.toString();
    data['value'] = this.value;
    return data;
  }
}