import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/theme/pallet.dart';
import 'package:garagewa/core/widgets/snackbar.dart';
import 'package:garagewa/core/widgets/splash.dart';
import 'package:garagewa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:garagewa/feature/auth/presentation/widgets/button.dart';
import 'package:garagewa/feature/auth/presentation/widgets/text_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailuer) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Splash();
            }

            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/logo.png',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Hello Chief! Welcome to GARAGEWA",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextWidget(
                      controller: emailController,
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Icons.mail_outlined,
                        color: AppPallet.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextWidget(
                      controller: passwordController,
                      hintText: "Password",
                      obsecure: true,
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: AppPallet.primaryColor,
                          size: 15,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: AppPallet.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      child: state is LoginLoading
                          ? const SizedBox(
                              child: CircularProgressIndicator(
                                  color: AppPallet.buttonLoadingColor),
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a Member?"),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot Password?"),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Reset",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
