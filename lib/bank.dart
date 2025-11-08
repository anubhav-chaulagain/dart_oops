import 'package:dart_oops/bank_account.dart';
import 'package:dart_oops/checking_account.dart';
import 'package:dart_oops/interest_bearing.dart';
import 'package:dart_oops/premium_account.dart';
import 'package:dart_oops/saving_account.dart';

class Bank {
  final Map<int, BankAccount> accounts = {};

  void createNewAcc({
    required String type,
    required int accNumber,
    required String accHolderName,
    required double balance,
  }) {
    switch (type) {
      case "saving":
        accounts[accNumber] = SavingAccount(
          accNumber: accNumber,
          accHolderName: accHolderName,
          balance: balance,
          type: type,
          history: <String>[],
        );
        break;

      case "checking":
        accounts[accNumber] = CheckingAccount(
          accNumber: accNumber,
          accHolderName: accHolderName,
          balance: balance,
          type: type,
          history: <String>[],
        );
        break;

      case "premium":
        accounts[accNumber] = PremiumAccount(
          accNumber: accNumber,
          accHolderName: accHolderName,
          balance: balance,
          type: type,
          history: <String>[],
        );
        break;
      default:
        print("Wrong Type!!!");
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
        acc1.history.add("$amt has been sent to account: $acc2");
        acc2.history.add("$amt has been received from account: $acc1");
      }
    } else {
      throw Exception("Accounts not found!");
    }
  }

  void applyMonthyInterest() {
    accounts.forEach((accNum, bankAccount) {
      var acc = accounts[accNum];
      if (acc is InterestBearing) {
        acc?.setBalance = acc.getBalance + acc.calculateInterest(1 / 12);
      }
    });
  }

  void generateReport() {
    accounts.forEach((accNum, acc) {
      acc.displayInfo();
    });
  }
}
