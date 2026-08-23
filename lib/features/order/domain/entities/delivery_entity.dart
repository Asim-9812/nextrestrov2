import 'package:equatable/equatable.dart';

class DeliveryEntity extends Equatable {
  final String address;
  final String city;
  final String state;
  final String postalCode;
  final String landmark;
  final String deliveryNotes;

  const DeliveryEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.landmark,
    required this.deliveryNotes,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'landmark': landmark,
      'deliveryNotes': deliveryNotes,
    };
  }

  @override
  List<Object?> get props => [address, city, state, postalCode, landmark, deliveryNotes];
}
