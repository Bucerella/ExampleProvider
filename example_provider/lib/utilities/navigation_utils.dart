import 'package:example_provider/views/user_details_screen.dart';
import 'package:flutter/material.dart';

Future<void> openUserDetails(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute<void>(builder: (context) => const UserDetailsScreen()),
  );
}
