import 'dart:io';
import 'package:example_provider/models/user_list_model.dart';
import 'package:example_provider/repository/api_status.dart';
import 'package:example_provider/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      final url = Uri.parse(userListUrl);
      debugPrint('Request url: ${url.toString()}');

      final response = await http.get(url);
      debugPrint('Response status code: ${response.statusCode.toString()}');

      if (response.statusCode == 200) {
        final usersList = usersListFromJson(response.body);
        return Success(code: 200, usersList: usersList);
      }
      debugPrint('Error: Invalid Response');
      return Failure(
          code: userInvalidResponse, errorMessage: 'Invalid Response');
    } on SocketException catch (e) {
      debugPrint('Error: ${e.message}');
      return Failure(code: noInternet, errorMessage: 'No Internet');
    } on HttpException catch (e) {
      debugPrint('Error: ${e.message}');
      return Failure(code: noServiceFound, errorMessage: 'No Service Found');
    } on FormatException catch (e) {
      debugPrint('Error: ${e.message}');
      return Failure(code: invalidFormat, errorMessage: 'Invalid Format');
    } on Exception catch (e) {
      debugPrint('Error: ${e.toString()}');
      return Failure(code: unknownError, errorMessage: 'Unknown Error');
    }
  }
}
