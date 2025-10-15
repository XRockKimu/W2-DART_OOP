class BankAccount {
// Q1 TODO
    int accountId;
    String owner;
    double _balance = 0;

    BankAccount(this.accountId, this.owner);
// Q2
    void credit(double amount) {
      if(amount <= 0) {
        throw Exception('invalid credit amount');
      }
      _balance += amount;
    }

    void withdraw(double amount) {
      if(_balance < amount) {
        throw Exception('Insufficient for balance withdrawal!');
      }
      _balance -= amount;
    }
}

class Bank {
// Q3 TODO
    String name;
    Map<int, BankAccount> _accounts = {};

    Bank({required this.name});
// Q4
    BankAccount createAccount(int accountId, String accountOwner) {
      if (_accounts.containsKey(accountId)) {
        throw Exception('Account with ID $accountId already exists!');
      }

      final account = BankAccount(accountId, accountOwner);
      _accounts[accountId] = account;
      return account;
    }
}
 
void main() {

   Bank myBank = Bank(name: "CADT Bank");
   BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

   print(ronanAccount._balance); // Balance: $0
   ronanAccount.credit(100);
   print(ronanAccount._balance); // Balance: $100
   ronanAccount.withdraw(50);
   print(ronanAccount._balance); // Balance: $50

   try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

   try {
     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
   } catch (e) {
     print(e); // Output: Account with ID 100 already exists!
   }
}

