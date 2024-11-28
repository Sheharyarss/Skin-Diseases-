import 'package:flutter/material.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/widgets/custom_text_field.dart';
import '../../core/constants/app_colors.dart';
import '../../shared/widgets/custom_button.dart';
import 'widgets/checkbox_with_link.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool _isPrivacyAccepted = false;
  bool _isSubscribedToOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signup to SkinVision',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: nameController,
              labelText: "Full Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              labelText: "Email",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: "Confirm Password",
              isPasswordField: true,
            ),
            const SizedBox(height: 24),
            CustomCheckboxWithLink(
              value: _isPrivacyAccepted,
              onChanged: (value) {
                setState(() {
                  _isPrivacyAccepted = value!;
                });
              },
              labelText: 'I have read and agree to the',
              link1Text: 'Privacy Policy',
              link2Text: 'Terms & Conditions',
              onLink1Tap: () {
                // Navigate to Privacy Policy
                print('Privacy Policy clicked');
              },
              onLink2Tap: () {
                // Navigate to Terms & Conditions
                print('Terms & Conditions clicked');
              },
            ),
            const SizedBox(height: 8),
            CustomCheckboxWithLink(
              value: _isSubscribedToOffers,
              onChanged: (value) {
                setState(() {
                  _isSubscribedToOffers = value!;
                });
              },
              labelText: 'Be the first to receive offers and newsletters',
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                if (_isPrivacyAccepted) {
                  // Proceed with signup
                  AppNavigator.pushNamed(AppRoutes.navbar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please agree to the Privacy Policy and Terms & Conditions to proceed.',
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
