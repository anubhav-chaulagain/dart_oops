import 'package:dart_oops/bank_account.dart';

class StudentAccount extends BankAccount {
  final double maxBalance = 5000;

  StudentAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
    required super.type,
    required super.history,
  });

  @override
  void deposit(double amount) {
    if (getBalance + amount > maxBalance) {
      print("Maximum balance reached (\$$maxBalance)");
    } else {
      setBalance = getBalance + amount;
      print("Deposited Successfully !");
      history.add("$amount has been deposited.");
    }
  }

  @override
  void withdraw(double amount) {
    if (getBalance - amount < 0) {
      print("Insufficient balance!!!");
    } else {
      setBalance = getBalance - amount;
      print("Withdrawn Successfully!!!");
      history.add(("$amount has been withdrawn!"));
    }
  }

  @override
  double calculateInterest(double time) {
    return 0;
  }
}
