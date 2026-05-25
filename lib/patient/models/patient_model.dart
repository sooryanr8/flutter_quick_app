class PatientModel {
  final String id;
  final String name;

  PatientModel({required this.id, required this.name});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json["id"]?.toString() ?? "",

      name: json["name"]?.toString() ?? "",
    );
  }

  @override
  String toString() {
    return name;
  }
}
