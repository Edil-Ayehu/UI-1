import 'package:flutter/material.dart';
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
              const Text(
                'Create\nAccount',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Please fill in the details to get started',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),

              // Enhanced Form Fields
              _buildTextField(
                label: 'Full Name',
                hint: 'Enter your name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Email',
                hint: 'name@example.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Password',
                hint: 'Create a strong password',
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscureText,
                onToggleVisibility: () =>
                    setState(() => _obscureText = !_obscureText),
              ),
              const SizedBox(height: 20),
              _buildTextField(
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
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Refined Social Sign Up Section
              Center(
                child: Text(
                  'Or continue with',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
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
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600,
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

  // Helper method for consistent TextField styling
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword && obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(icon, color: Colors.grey.shade400),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
