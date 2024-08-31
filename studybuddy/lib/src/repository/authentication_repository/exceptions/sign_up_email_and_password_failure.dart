class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure({required this.message});

  factory SignUpEmailAndPasswordFailure.code(String code) {
    if (code.contains('email-already-in-use')) {
      return const SignUpEmailAndPasswordFailure(
          message: "An acount already exists for this email."
              " Please sign in instead.");
    }
    switch (code) {
      case 'credential-already-in-use':
        return const SignUpEmailAndPasswordFailure(
            message: "An account with the email credentials already exist. "
                "Please sign in with the method used to sign up. ");
      case "ERROR_OPERATION_NOT_ALLOWED":
        return const SignUpEmailAndPasswordFailure(
            message: "Please contact support");
      case "ERROR_INVALID_EMAIL":
        return const SignUpEmailAndPasswordFailure(
            message: "The email address is badly formatted.");
      case "ERROR_WEAK_PASSWORD":
        return const SignUpEmailAndPasswordFailure(
            message: "Please enter a stronger password.");
      case "ERROR_USER_DISABLED":
        return const SignUpEmailAndPasswordFailure(
            message: "This user has been disbled."
                " Please contact support for more information.");

      default:
        return const SignUpEmailAndPasswordFailure(
            message: "An unknown error occured.");
    }
  }

  @override
  List<Object?> get props => [message];
}
