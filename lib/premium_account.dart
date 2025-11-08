import 'package:dart_oops/bank_account.dart';
import 'package:dart_oops/interest_bearing.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  final double minBalance = 10000;
  final double _interest = 5;

  PremiumAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
    required super.type,
    required super.history,
  });

  @override
  void deposit(double amount) {
    setBalance = getBalance + amount;
    print("Deposited Successfully !");
    history.add("$amount has been deposited.");
  }

  @override
  void withdraw(double amount) {
    if ((getBalance - amount) < minBalance) {
      print("Minimum balance requirement of \$500 !!!");
    } else {
      setBalance = getBalance - amount;
      print("Amount $amount has been withdrawn !");
      history.add("$amount has been withdrawn");
    }
  }

  @override
  double calculateInterest(double time) {
    return (getBalance * time * _interest) / 100;
  }
}
