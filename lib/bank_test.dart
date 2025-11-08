import 'package:dart_oops/bank.dart';
import 'package:dart_oops/bank_account.dart';
import 'package:dart_oops/interest_bearing.dart';

void main() {
  Bank bank = Bank();

  bank.createNewAcc(
    type: "saving",
    accNumber: 202500001,
    accHolderName: "Gaurab Khadka",
    balance: 500,
  );
  bank.createNewAcc(
    type: "checking",
    accNumber: 202500002,
    accHolderName: "Prabin Giri",
    balance: 500,
  );
  bank.createNewAcc(
    type: "premium",
    accNumber: 202500003,
    accHolderName: "Anubhav Chaulagain",
    balance: 10000,
  );

  //  // Saving accounts
  BankAccount savingAccount = bank.findAccountByAccNum(accNum: 202500001);

  // // deposit
  // savingAccount.deposit(500);

  // withdraw
  // savingAccount.withdraw(600); // Less than minimum balance

  // savingAccount.withdraw(100); // checking the withdrawl limit
  // savingAccount.withdraw(100);
  // savingAccount.withdraw(100);
  // savingAccount.withdraw(100);

  // print(savingAccount.calculateInterest(2));

  // savingAccount.displayInfo();

  // // Checking Account
  BankAccount checkingAccount = bank.findAccountByAccNum(accNum: 202500002);

  // deposit
  // checkingAccount.deposit(200);

  // withdraw - the balance goes negative after withdrawl $35 is charged as overdraft fee
  // checkingAccount.withdraw(700); // makes 0 which is not less than $0

  // checkingAccount.withdraw(100); // charges $35

  // checkingAccount.displayInfo();

  // Premium Account
  BankAccount premiumAccount = bank.findAccountByAccNum(accNum: 202500003);

  // // deposit
  // premiumAccount.deposit(500);

  // // withdraw
  // premiumAccount.withdraw(1000);

  // interest
  print(premiumAccount.calculateInterest(2));

  // premiumAccount.displayInfo();
}
