import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/reprository/auth_reprository.dart';

final authControllerProvider = Provider((ref) => AuthController(authReprository: ref.read(authRprositoryProvider)));

class AuthController {
  final AuthReprository _authReprository;
  AuthController({required AuthReprository authReprository})
      : _authReprository = authReprository;

  void signInWithGoogle() {
    _authReprository.signInWithGoogle();
  }
}
