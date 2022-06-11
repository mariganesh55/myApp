import 'spacecraft.dart';

class ListOfSpacecraft {
  List<Spacecraft>? spacecrafts;

  ListOfSpacecraft({this.spacecrafts});

  factory ListOfSpacecraft.fromJson(Map<String, dynamic> json) {
    return ListOfSpacecraft(
      spacecrafts: (json['spacecrafts'] as List<dynamic>?)
          ?.map((e) => Spacecraft.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'spacecrafts': spacecrafts?.map((e) => e.toJson()).toList(),
      };
}
