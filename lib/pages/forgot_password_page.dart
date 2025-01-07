import 'package:flutter/material.dart';
import 'package:signin_ui/utils/app_textstyle.dart';
import 'package:signin_ui/widgets/custom_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade50,
                  padding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 32),

              // Header Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade50,
                      Colors.deepPurple.shade100,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.lock_reset,
                    size: 32, color: Colors.deepPurple.shade400),
              ),
              const SizedBox(height: 24),

              // Title and Description
              Text(
                'Forgot Password?',
                style: AppTextStyle.h2,
              ),
              const SizedBox(height: 12),
              Text(
                'No worries! Enter your email and we\'ll send you reset instructions.',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMedium,
                  Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),

              // Email Input Field
              Text(
                'Email',
                style: AppTextStyle.withColor(
                  AppTextStyle.labelMedium,
                  Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 8),
              const CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Reset Password Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showResetSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    style: AppTextStyle.buttonLarge,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Back to Sign in
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Back to Sign in',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResetSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.mark_email_read,
                      size: 32, color: Colors.deepPurple),
                ),
                const SizedBox(height: 24),
                Text(
                  'Check your email',
                  style: AppTextStyle.h3,
                ),
                const SizedBox(height: 8),
                Text(
                  'We have sent password recovery instructions to your email.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'OK, got it!',
                      style: AppTextStyle.buttonMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
