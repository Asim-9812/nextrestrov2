class AddressData {
  String label;
  String address;
  String city;
  String state;
  String postalCode;
  String landmark;
  String deliveryNotes;
  bool isEditing;

  AddressData({
    required this.label,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.landmark,
    required this.deliveryNotes,
    this.isEditing = false,
  });
}
