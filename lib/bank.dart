import 'package:dart_oops/bank_account.dart';
import 'package:dart_oops/checking_account.dart';
import 'package:dart_oops/premium_account.dart';
import 'package:dart_oops/saving_account.dart';

class Bank {
  final Map<int, BankAccount> accounts = {};

  int _accNumber;
  String _accHolderName;
  double _balance;

  Bank({
    required int accNumber,
    required String accHolderName,
    required double balance,
  }) : _accNumber = accNumber,
       _accHolderName = accHolderName,
       _balance = balance;

  void createNewAcc({required String type}) {
    switch (type) {
      case "saving":
        accounts[_accNumber] = SavingAccount(
          accNumber: 202500001,
          accHolderName: "Anubhav Chaulagain",
          balance: 500,
        );
        break;

      case "checking":
        accounts[_accNumber] = CheckingAccount(
          accNumber: 202500001,
          accHolderName: "Anubhav Chaulagain",
          balance: 500,
        );
        break;

      case "premium":
        accounts[_accNumber] = PremiumAccount(
          accNumber: 202500001,
          accHolderName: "Anubhav Chaulagain",
          balance: 500,
        );
        break;
    }
  }

  BankAccount findAccountByAccNum({required int accNum}) {
    if (accounts.containsKey(accNum)) {
      return accounts[accNum]!; // safe because we checked
    } else {
      throw Exception("Account $accNum not found");
    }
  }

  void transferMoneyBetweenAccounts({
    required int accNum1,
    required int accNum2,
    required double amt,
  }) {
    if (accounts.containsKey(accNum1) && accounts.containsKey(accNum2)) {
      BankAccount? acc1 = accounts[accNum1];
      BankAccount? acc2 = accounts[accNum2];
      if (acc1!.getBalance - amt < 0) {
        print("Insufficient amount in Acc/no: $acc1");
      } else {
        acc1.withdraw(amt);
        acc2!.deposit(amt);
      }
    } else {
      throw Exception("Accounts not found!");
    }
  }
}
