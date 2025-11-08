import 'package:dart_oops/bank_account.dart';
import 'package:dart_oops/interest_bearing.dart';

class SavingAccount extends BankAccount implements InterestBearing {
  final double minBalance = 500;
  int _withdrawThisMonth = 0;
  final int _withdrawlLimit = 3;
  final double _interestRate = 2;

  SavingAccount({
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
    if (_withdrawThisMonth >= _withdrawlLimit) {
      print(
        "The limit of withdrawl for this month ($_withdrawlLimit) has been reached !!!",
      );
    } else {
      if ((getBalance - amount) < minBalance) {
        print("Minimum balance requirement of \$500 !!!");
      } else {
        setBalance = getBalance - amount;
        print("Amount $amount has been withdrawn !");
        _withdrawThisMonth++;
        history.add("$amount has been withdrawn!");
      }
    }
  }

  void resetWithdrawlThisMonth() {
    _withdrawThisMonth = 0;
  }

  @override
  double calculateInterest(double time) {
    return (getBalance * time * _interestRate) / 100;
  }
}
