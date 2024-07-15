part of '../bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationDataLoaded extends AuthenticationState {
  AuthenticationDataLoaded({
    required this.focusNodePasswordConfirmation,
    required this.textControllerNameSignup,
    required this.textControllerEmailSignUp,
    required this.textControllerPasswordSignUp,
    required this.textControllerPasswordConfirmationSignUp,
    required this.textControllerEmailSignIn,
    required this.textControllerPasswordSignIn,
    required this.isSignInPasswordVisible,
    required this.isSignUpPasswordVisible,
    required this.isSignUpPasswordConfirmationVisible,
  });

  final FocusNode focusNodePasswordConfirmation;
  
  final TextEditingController textControllerNameSignup;
  final TextEditingController textControllerEmailSignUp;
  final TextEditingController textControllerPasswordSignUp;
  final TextEditingController textControllerPasswordConfirmationSignUp;
  final TextEditingController textControllerEmailSignIn;
  final TextEditingController textControllerPasswordSignIn;

  final bool isSignInPasswordVisible;
  final bool isSignUpPasswordVisible;
  final bool isSignUpPasswordConfirmationVisible;
}
