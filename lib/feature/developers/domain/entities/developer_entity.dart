class DeveloperEntity {
  const DeveloperEntity({
    required this.id,
    required this.name,
    required this.logo,
    this.email,
    this.phone,
    this.address,
  });

  final int id;
  final String name;
  final String logo;
  final String? email;
  final String? phone;
  final String? address;
}
