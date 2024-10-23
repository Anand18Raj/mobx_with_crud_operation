class GroupType {
  final int id;
  late final String name;

  GroupType({required this.id, required this.name});

  factory GroupType.fromJson(Map<String, dynamic> json) {
    return GroupType(
      id: json['Id'],
      name: json['Name'],
    );
  }
}
