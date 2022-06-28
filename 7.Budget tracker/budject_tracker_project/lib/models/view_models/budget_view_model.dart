import 'package:budject_tracker_project/models/transaction_item.dart';
import 'package:budject_tracker_project/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class BudgetViewModel extends ChangeNotifier {
  double getBudget() => LocalStorageService().getBudget();

  double getBalance() => LocalStorageService().getBalance();

  List<TransactionItem> get items => LocalStorageService().getAllTransactions();

  set budget(double value) {
    LocalStorageService().saveBudget(value);
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    LocalStorageService().saveTransactionItem(item);
    notifyListeners();
  }

  void deleteItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    // Call our localstorage service to delete the item
    localStorage.deleteTransactionItem(item);
    // Notify the listeners
    notifyListeners();
  }
}
