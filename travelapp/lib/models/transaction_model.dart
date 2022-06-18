import 'package:equatable/equatable.dart';
import 'package:travelapp/models/destination_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int amountOFTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refaundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOFTraveler = 0,
    this.selectedSeats = '',
    this.grandTotal = 0,
    this.insurance = false,
    this.refaundable = false,
    this.vat = 0,
    this.price = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
       destination: DestinationModel.fromJson(json['destination'] ['id'], json['destination']),
       id: id,
       amountOFTraveler: json['amountOFTraveler'],
       selectedSeats: json['selectedSeats'],
       insurance: json['insurance'],
       refaundable: json['refaundable'],
       vat: json['vat'],
       price: json['price'],
       grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        destination,
        amountOFTraveler,
        selectedSeats,
        insurance,
        refaundable,
        vat,
        price,
        grandTotal,
      ];
}
