class Spacecraft {
  int? id;
  String? name;

  Spacecraft({this.id, this.name});

  factory Spacecraft.fromJson(Map<String, dynamic> json) => Spacecraft(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
