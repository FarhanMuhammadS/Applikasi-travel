import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/models/transaction_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amountOFTraveler': transaction.amountOFTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refaundable': transaction.refaundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchDestinations() async {
    try {
      
     QuerySnapshot result = await _transactionReference.get();

     List<TransactionModel> transactions = result.docs.map((e) {
      return TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>);
     }).toList();
     return transactions;

    } catch (e) {
      throw e;
    }
  }
}
