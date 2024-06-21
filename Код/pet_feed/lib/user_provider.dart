import 'package:flutter/material.dart';
import 'package:pet_feed/user.dart';

class UserProvider extends InheritedWidget {
  final UserInfo user;

  UserProvider({required this.user, required Widget child})
      : super(child: child);

  static UserInfo of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>()!.user;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return user != oldWidget.user;
  }
}
