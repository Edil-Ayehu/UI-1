import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signin_ui/utils/app_textstyle.dart';
import 'package:signin_ui/widgets/custom_textfield.dart';
import 'package:signin_ui/widgets/social_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Minimal Back Button
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade50,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),

              // Modern Welcome Section
              Text(
                'Create\nAccount',
                style: AppTextStyle.h1,
              ),
              const SizedBox(height: 12),
              Text(
                'Please fill in the details to get started',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),

              // Enhanced Form Fields
              const CustomTextField(
                label: 'Full Name',
                hint: 'Enter your name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Email',
                hint: 'name@example.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Password',
                hint: 'Create a strong password',
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscureText,
                onToggleVisibility: () =>
                    setState(() => _obscureText = !_obscureText),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Confirm Password',
                hint: 'Repeat your password',
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscureConfirmText,
                onToggleVisibility: () =>
                    setState(() => _obscureConfirmText = !_obscureConfirmText),
              ),
              const SizedBox(height: 32),

              // Modern Sign Up Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Create Account',
                  style: AppTextStyle.buttonLarge,
                ),
              ),
              const SizedBox(height: 24),

              // Refined Social Sign Up Section
              Center(
                child: Text(
                  'Or continue with',
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodySmall,
                    Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Modern Social Buttons Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(imagePath: 'assets/images/google.png'),
                  SizedBox(width: 16),
                  SocialButton(imagePath: 'assets/images/apple.png'),
                  SizedBox(width: 16),
                  SocialButton(imagePath: 'assets/images/fb.png'),
                ],
              ),
              const SizedBox(height: 24),

              // Enhanced Sign In Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Sign in',
                        style: AppTextStyle.withColor(
                          AppTextStyle.buttonMedium,
                          Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
