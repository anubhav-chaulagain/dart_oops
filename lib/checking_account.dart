import 'package:dart_oops/bank_account.dart';

class CheckingAccount extends BankAccount {
  final double overDraftFee = 35;
  bool _overdraft = false;

  CheckingAccount({
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
    if (getBalance < 0 && getBalance + amount > 0) {
      _overdraft = false;
    }
  }

  @override
  void withdraw(double amount) {
    if (!_overdraft && (getBalance - amount < 0)) {
      setBalance = getBalance - amount - overDraftFee;
      print(
        "\$35 has been charged as overdraft fee since balance is less than \$0",
      );
      _overdraft = true;
    } else {
      setBalance = getBalance - amount;
      print("Amount $amount has been withdrawn !");
      history.add("$amount has been withdrawn");
    }
  }

  @override
  double calculateInterest(double time) {
    return 0;
  }
}
