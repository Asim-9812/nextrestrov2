class AddressData {
  String label;
  String line1;
  String line2;
  String city;
  String province;
  String houseNo;
  bool isEditing;

  AddressData({
    required this.label,
    required this.line1,
    required this.line2,
    required this.city,
    required this.province,
    required this.houseNo,
    this.isEditing = false,
  });
}
