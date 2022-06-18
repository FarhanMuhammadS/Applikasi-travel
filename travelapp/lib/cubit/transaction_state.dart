part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSucces extends TransactionState {
  final List<TransactionModel> transactions;
   
   TransactionSucces(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String error;

  TransactionFailed(this.error);

  @override
  List<Object> get props => [error];
}

