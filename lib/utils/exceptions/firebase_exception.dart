class TFirebaseException implements Exception {
  /// The errror code associated with the exception.[İstisnayla ilişkili hata kodu.]
  final String code;

  /// Constructor that takes an error code.[Hata kodunu alan yapıcı.]
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.[Hata koduna göre ilgili hata mesajını alın.]
  String get message {
    switch (code) {
      case 'unknown':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-custom-token':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'custom-token-mismatch':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'invalid-email':
        return 'Incorrect password. Please check your password and try again.';
      case 'email-already-in-use':
        return 'The email address already exists. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This opatation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An unexpected Firebase error accurred. Please try again.';
    }
  }
}
