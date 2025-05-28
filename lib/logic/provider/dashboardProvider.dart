
import 'package:flutter/material.dart';
import 'package:walkin/Model/dashboardModel.dart';

class DashboardProvider with ChangeNotifier {
  DashboardModel? _dashboardModel;

  DashboardModel? get dashboardModel => _dashboardModel;

  Future<void> loadDashboardData() async {
    _dashboardModel = await DashboardModel.loadFromAssets();
    notifyListeners();
  }
}