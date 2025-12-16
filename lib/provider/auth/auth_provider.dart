import 'package:flutter/material.dart';
import 'package:walletric/repository/auth/auth_repo.dart';

class AuthPro with ChangeNotifier {
  final AuthRepo authRepo;
  AuthPro(this.authRepo);
}
