abstract class Account{
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount){
      balance += amount;
      print("Deposited: $amount");
      print("Current Balance: $balance");
  }

  void withdraw(double amount);

}

class SavingsAccount extends Account{
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount){
    balance -=amount;
    balance += (balance*interestRate);
    print("Deposited: $amount");
    print("Current Balance: $balance");
  }
}

class CurrentAccount extends Account{
  double overdraftLimit;
  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount){
    if(amount <= balance + overdraftLimit){
      balance -= amount;
      print("Deposited: $amount");
      print("Current Balance: $balance");
    }else{
      print("Insufficient funds. Overdraft limit exceeded.");
    }
  }

}

void main(){

  //SavingsAccount
  SavingsAccount saving = SavingsAccount(0098765, 10000, 0.8);
  saving.deposit(5000);
  saving.withdraw(2000);

  //CurrentAccount
  CurrentAccount current = CurrentAccount(90807654, 12000, 10000);
  current.deposit(3000);
  current.withdraw(50000);
}
