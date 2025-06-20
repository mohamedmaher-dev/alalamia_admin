part of '../sign_in_view.dart';

/// Sign in button widget with form validation and authentication logic
/// Validates form data and triggers authentication API call when pressed
/// Integrates with SignInCubit for state management and user feedback
class _SignInBtn extends StatelessWidget {
  const _SignInBtn();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<SignInCubit>();
    return BlocListener<SignInCubit, SignInState>(
      // Listen to authentication state changes for user feedback
      listener: _listener,
      child: FilledButton(
        onPressed: () {
          // Validate form fields before attempting authentication
          final isValid = cubit.formKey.currentState!.validate();
          if (isValid) {
            // Create sign in request model with form data
            final signInRequestModel = SignInRequestModel(
              email: cubit.email.text,
              password: cubit.password.text,
            );
            // Trigger authentication API call
            cubit.signIn(signInRequestModel);
          }
        },
        style: ButtonStyle(
          // Rounded corners matching app design language
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
          ),
          // Full width button with standard height
          minimumSize: WidgetStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width, kBottonHight),
          ),
        ),
        // Localized sign in text with bold styling
        child: Text(language.sign_in, style: TextStyles.ts12B),
      ),
    );
  }
}
