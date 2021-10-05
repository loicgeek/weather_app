class Weather {
  int id;
  String main;
  String desc;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.desc,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json["main"],
      desc: json["description"],
      icon: json["icon"],
    );
  }
}
