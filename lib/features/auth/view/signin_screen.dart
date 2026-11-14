import 'package:flutter/material.dart';

import 'package:meal_planner/features/auth/service/auth_service.dart';
import 'package:meal_planner/features/auth/service/session_service.dart';
import 'package:meal_planner/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:meal_planner/features/auth/widgets/auth_text_field.dart';
import 'package:meal_planner/features/auth/widgets/social_login_button.dart';
import 'package:meal_planner/features/home/view/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static const Color _primaryPurple = Color(0xFF471AA0);
  static const Color _lightPurple = Color(0xFFB678E6);

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthViewModel _authViewModel = AuthViewModel(
    AuthService(),
    SessionService(),
  );

  Future<void> _signIn() async {
    final isAuthenticated = await _authViewModel.signIn(
      login: _loginController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    if (!isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid login or password'),
        ),
      );

      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 2),

                      Center(
                        child: Image.asset(
                          'assets/logo.png',
                          width: 129,
                          height: 129,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 21),

                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: _primaryPurple,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          letterSpacing: 0,
                        ),
                      ),

                      const SizedBox(height: 46),

                      AuthTextField(
                        controller: _loginController,
                        hintText: 'Email or user name',
                        prefixIcon: Icons.person_outline,
                        textShadow: true,
                      ),

                      const SizedBox(height: 40),

                      AuthTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: true,
                        suffixIcon: const Icon(
                          Icons.visibility_outlined,
                          color: Color.fromRGBO(0, 0, 0, 0.70),
                        ),
                      ),

                      const SizedBox(height: 40),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: _primaryPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            letterSpacing: 0,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _signIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _lightPurple,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 75),

                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Or sign in with',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: _primaryPurple,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: 0,
                                shadows: [
                                  Shadow(
                                    color: Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.25,
                                    ),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SocialLoginButton(
                                  assetPath: 'assets/google.png',
                                  onPressed: () {},
                                ),

                                const SizedBox(width: 24),

                                SocialLoginButton(
                                  assetPath: 'assets/facebook.png',
                                  onPressed: () {},
                                ),

                                const SizedBox(width: 24),

                                SocialLoginButton(
                                  assetPath: 'assets/x.png',
                                  onPressed: () {},
                                ),

                                const SizedBox(width: 24),

                                SocialLoginButton(
                                  assetPath: 'assets/linkedin.png',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 103),

                      Center(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _primaryPurple,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Don't have account? ",
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}