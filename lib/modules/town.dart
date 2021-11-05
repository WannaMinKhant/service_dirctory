import 'dart:convert';

Town townFromJson(String str) => Town.fromJson(json.decode(str));

const String table = "townships_of_burma";

class TownFields{
  static final List<String> values = [
    Region,
    State,
    Name,
    Township,
  ];

  static const String Region = "region";
  static const String State = "state";
  static const String Name = "name";
  static const String Township = "township";

}

class Town{
  final String region;
  final String state;
  final String name;
  final String township;

  const Town({
    required this.region,
    required this.state,
    required this.name,
    required this.township,
  });

  Town copy({
  int? id,
    String? region,
    String? state,
    String? name,
    String? township,
  }) =>
      Town(
          region: region ?? this.region,
        state: state ?? this.state,
        name: name ?? this.name,
        township: township ?? this.township
      );

  factory Town.fromJson(Map<String, dynamic> json) => Town(
    region: json['region'].toString(),
    state: json['state'].toString(),
    name: json['name'].toString(),
    township: json['township'].toString(),
  );


  static Town fromJsonForm(Map<String, Object?> json) => Town(
    region: json[TownFields.Region] as String,
    state: json[TownFields.State] as String,
    name: json[TownFields.Name] as String,
    township: json[TownFields.Township] as String,
  );

  Map<String, Object?> toJson() => {
    TownFields.Region : region,
    TownFields.State : state,
    TownFields.Name : name,
    TownFields.Township : township,
  };
}