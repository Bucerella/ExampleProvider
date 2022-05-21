import 'dart:collection';
import 'package:example_provider/models/user_error.dart';
import 'package:example_provider/models/user_list_model.dart';
import 'package:example_provider/repository/api_status.dart';
import 'package:example_provider/repository/user_services.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  bool get loading => _loading;
  UnmodifiableListView<UserModel> get usersList =>
      UnmodifiableListView(_usersList);
  UserModel get selectedUser => _selectedUser;
  UserError? get userError => _userError;

  bool _loading = false;
  Iterable<UserModel> _usersList = [];
  late UserModel _selectedUser;
  UserError? _userError;

  void setSelectedUser(UserModel selectedUser) {
    _selectedUser = selectedUser;
    notifyListeners();
  }

  void toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    _userError = null;
    _usersList = [];

    toggleLoading();
    final response = await UserServices.getUsers();
    await Future<void>.delayed(const Duration(seconds: 1));

    if (response is Success) {
      _usersList = response.usersList as List<UserModel>;
      print("this is _userList ${_usersList}");
    }
    if (response is Failure) {
      _userError =
          UserError(code: response.code, message: response.errorMessage);
    }
    toggleLoading();
  }
}
