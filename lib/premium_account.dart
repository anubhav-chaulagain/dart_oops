import 'package:dart_oops/bank_account.dart';

class PremiumAccount extends BankAccount {
  final double minBalance = 10000;

  PremiumAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    setBalance = getBalance + amount;
    print("Deposited Successfully !");
  }

  @override
  void withdraw(double amount) {
    if ((getBalance - amount) < minBalance) {
      print("Minimum balance requirement of \$500 !!!");
    } else {
      setBalance = getBalance - amount;
      print("Amount $amount has been withdrawn !");
    }
  }

  double interestCalculation(double time) {
    return (getBalance * time * 2) / 100;
  }
}
