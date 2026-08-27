import 'package:flutter/foundation.dart';

class TransactionItem {
  final String id;
  final String storeName;
  final double amount;
  final double cashback;
  final String status; // 'Pending', 'Confirmed', 'Paid'
  final DateTime date;

  TransactionItem({
    required this.id,
    required this.storeName,
    required this.amount,
    required this.cashback,
    required this.status,
    required this.date,
  });
}

class UserModel extends ChangeNotifier {
  String _userId = "USER_987452";
  String _userName = "Rahul Sharma";
  double _confirmedEarnings = 450.00;
  double _pendingEarnings = 185.50;
  double _referralEarnings = 100.00;

  final List<TransactionItem> _transactions = [
    TransactionItem(
      id: 'TXN1001',
      storeName: 'Flipkart',
      amount: 2499.00,
      cashback: 185.50,
      status: 'Pending',
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    TransactionItem(
      id: 'TXN0982',
      storeName: 'AJIO',
      amount: 1500.00,
      cashback: 180.00,
      status: 'Confirmed',
      date: DateTime.now().subtract(const Duration(days: 15)),
    ),
    TransactionItem(
      id: 'TXN0954',
      storeName: 'Amazon India',
      amount: 4300.00,
      cashback: 270.00,
      status: 'Confirmed',
      date: DateTime.now().subtract(const Duration(days: 28)),
    ),
  ];

  String get userId => _userId;
  String get userName => _userName;
  double get confirmedEarnings => _confirmedEarnings;
  double get pendingEarnings => _pendingEarnings;
  double get referralEarnings => _referralEarnings;
  double get totalBalance => _confirmedEarnings + _pendingEarnings;
  List<TransactionItem> get transactions => List.unmodifiable(_transactions);

  void addPendingCashback(String storeName, double orderVal, double cashbackVal) {
    _transactions.insert(
      0,
      TransactionItem(
        id: 'TXN${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        storeName: storeName,
        amount: orderVal,
        cashback: cashbackVal,
        status: 'Pending',
        date: DateTime.now(),
      ),
    );
    _pendingEarnings += cashbackVal;
    notifyListeners();
  }

  bool withdrawEarnings(double amount, String upiId) {
    if (amount <= _confirmedEarnings && amount >= 250) {
      _confirmedEarnings -= amount;
      notifyListeners();
      return true;
    }
    return false;
  }
}
