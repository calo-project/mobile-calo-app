part of '../screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationDataLoaded) {
          if (kDebugMode) {
            state.textControllerEmailSignUp.text = 'altamismail1@gmail.com';
            state.textControllerPasswordSignUp.text = 'bismillah';
            state.textControllerPasswordConfirmationSignUp.text = 'bismillah';
            state.textControllerNameSignup.text = 'altamis atmaja';
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Config.primaryColor,
              title: const Text(
                'Yuk, buat akun baru!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Config.primaryColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const _InputLabel(label: 'Nama'),
                        const SizedBox(height: 10),
                        _InputField(
                          controller: state.textControllerNameSignup,
                          hintText: 'Enter Your Name',
                          isPassword: false,
                        ),
                        const SizedBox(height: 20),
                        const _InputLabel(label: 'Email'),
                        const SizedBox(height: 10),
                        _InputField(
                          controller: state.textControllerEmailSignUp,
                          hintText: 'Enter Your Email',
                          isPassword: false,
                        ),
                        const SizedBox(height: 20),
                        const _InputLabel(label: 'Password'),
                        const SizedBox(height: 10),
                        _InputField(
                            controller: state.textControllerPasswordSignUp,
                            hintText: 'Enter Your Password',
                            isPassword: true,
                            isPasswordVisible: state.isSignUpPasswordVisible,
                            togglePasswordVisibility: () => MyApp.authBloc.add(
                                SetSignUpPasswordVisible(
                                    value: !state.isSignUpPasswordVisible))),
                        const SizedBox(height: 20),
                        const _InputLabel(label: 'Konfirmasi Password'),
                        const SizedBox(height: 10),
                        _InputField(
                          controller:
                              state.textControllerPasswordConfirmationSignUp,
                          hintText: 'Enter Your Confirmation Password',
                          isPassword: true,
                          isPasswordVisible:
                              state.isSignUpPasswordConfirmationVisible,
                          togglePasswordVisibility: () => MyApp.authBloc.add(
                              SetSignUpPasswordConfirmationVisible(
                                  value: !state
                                      .isSignUpPasswordConfirmationVisible)),
                          onEditingComplete: () {
                            MyApp.authBloc.add(
                              SignUpPressed(),
                            );
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () =>
                                MyApp.authBloc.add(SignUpPressed()),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Config.buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Daftar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sudah punya akun?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.signInScreen);
                              },
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Config.buttonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;
  const _InputLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? togglePasswordVisibility;
  final VoidCallback? onEditingComplete;

  const _InputField({
    required this.controller,
    required this.hintText,
    required this.isPassword,
    this.isPasswordVisible = false,
    this.togglePasswordVisibility,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      textInputAction: TextInputAction.next,
      obscureText: isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: togglePasswordVisibility,
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      onEditingComplete: onEditingComplete,
    );
  }
}
