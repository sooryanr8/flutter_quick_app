class PatientModel {
  final String id;
  final String name;

  PatientModel({
    required this.id,
    required this.name,
  });

  factory PatientModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PatientModel(
      id: json["partyId"] ?? "",

      name:
      "${json["firstName"] ?? ""} "
          "${json["lastName"] ?? ""}",
    );
  }
}