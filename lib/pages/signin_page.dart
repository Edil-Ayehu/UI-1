import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signin_ui/pages/forgot_password_page.dart';
import 'package:signin_ui/pages/signup_page.dart';
import 'package:signin_ui/utils/app_textstyle.dart';
import 'package:signin_ui/widgets/custom_textfield.dart';
import 'package:signin_ui/widgets/social_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Modern App Icon with subtle gradient
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.shade50,
                        Colors.deepPurple.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.language,
                      size: 40, color: Colors.deepPurple.shade400),
                ),
                const SizedBox(height: 32),

                // Refined Welcome Text
                Text(
                  'Welcome back',
                  style: AppTextStyle.h2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter your details to sign in',
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 48),

                // Enhanced TextField styling
                const SizedBox(height: 32),
                const CustomTextField(
                  label: 'Email',
                  hint: 'name@example.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  obscureText: _obscureText,
                  onToggleVisibility: () =>
                      setState(() => _obscureText = !_obscureText),
                ),

                // Remember Me and Forgot Password with subtle design
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Remember me',
                          style: AppTextStyle.withColor(
                            AppTextStyle.bodyMedium,
                            Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                      ),
                      child: Text(
                        'Forgot password?',
                        style: AppTextStyle.buttonMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Sign In Button with gradient
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: AppTextStyle.buttonLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Or continue with section
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                            color: Colors.grey.shade300, thickness: 0.5)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or continue with',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodySmall,
                          Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                            color: Colors.grey.shade300, thickness: 0.5)),
                  ],
                ),
                const SizedBox(height: 32),

                // Social buttons with enhanced spacing
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(imagePath: 'assets/images/google.png'),
                    SizedBox(width: 20),
                    SocialButton(imagePath: 'assets/images/apple.png'),
                    SizedBox(width: 20),
                    SocialButton(imagePath: 'assets/images/fb.png'),
                  ],
                ),
                const SizedBox(height: 32),

                // Create account link with enhanced typography
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text(
                        'Create account',
                        style: AppTextStyle.withColor(
                          AppTextStyle.buttonMedium,
                          Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
