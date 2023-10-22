class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure({this.message = "An unknown error occurred"});

  factory SignUpEmailAndPasswordFailure.code(String code){
    switch(code) {
      case "ERROR_OPERATION_NOT_ALLOWED":
        return const SignUpEmailAndPasswordFailure(message: "Please contact support");
      case "ERROR_INVALID_EMAIL":
        return const SignUpEmailAndPasswordFailure(message: "The email address is badly formatted.");
      case "ERROR_WEAK_PASSWORD":
        return const SignUpEmailAndPasswordFailure(message: "Please enter a stronger password.");

      case "ERROR_EMAIL_ALREADY_IN_USE":
        return const SignUpEmailAndPasswordFailure(message: "An acount already exists for this email."
            " Please sign in instead.");
      case "ERROR_USER_DISABLED":
        return const SignUpEmailAndPasswordFailure(message: "This user has been disbled."
            " Please contact support for more information.");

      default:
        return const SignUpEmailAndPasswordFailure();
    }
  }

  @override
  List<Object?> get props => [message];
}