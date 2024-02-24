class LoginEmailAndPasswordFailure{
  final String message;

  LoginEmailAndPasswordFailure({this.message = 'Login failed'});

  factory LoginEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'ERROR_INVALID_EMAIL':
        return LoginEmailAndPasswordFailure(message: 'The email address is badly formatted.');
      case 'ERROR_WRONG_PASSWORD':
        return LoginEmailAndPasswordFailure(message: 'The password is incorrect.');
      case 'ERROR_USER_NOT_FOUND':
        return LoginEmailAndPasswordFailure(message: 'No user found for this email.');
      case 'ERROR_USER_DISABLED':
        return LoginEmailAndPasswordFailure(message: 'This user has been disabled.');
      case 'ERROR_TOO_MANY_REQUESTS':
        return LoginEmailAndPasswordFailure(message: 'Too many requests. Please try again later.');
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return LoginEmailAndPasswordFailure(message: 'Please contact support.');
      default:
        return LoginEmailAndPasswordFailure();
    }
  }
}