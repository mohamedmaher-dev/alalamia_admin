part of '../sign_in_view.dart';

/// Form widget containing email and password input fields for authentication
/// Provides validation, password visibility toggle, and proper keyboard handling
/// Integrates with SignInCubit for form state management and validation
class _FormBody extends StatelessWidget {
  const _FormBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    final signIn = context.read<SignInCubit>();
    return Form(
      // Validate fields as user types for immediate feedback
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // Form key for programmatic validation control
      key: signIn.formKey,
      child: Column(
        children: [
          // Email input field with validation
          TextFormField(
            controller: signIn.email,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              // Email icon for visual clarity
              prefixIcon: const Icon(Icons.email),
              hintText: language.email,
              // Rounded border matching app design
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kNormalRadius),
                borderSide: BorderSide.none,
              ),
            ),
            // Email keyboard for better UX
            keyboardType: TextInputType.emailAddress,
            // Move to next field when done
            textInputAction: TextInputAction.next,
            // Email format validation
            validator: FormValidation.validateEmail,
          ),
          SizedBox(height: kSpacingBetweenWidgetsHight),
          // Password input field with visibility toggle
          BlocBuilder<SignInCubit, SignInState>(
            builder:
                (final context, final state) => TextFormField(
                  controller: signIn.password,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    // Password icon for visual clarity
                    prefixIcon: const Icon(Icons.password),
                    hintText: language.password,
                    // Rounded border matching app design
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kNormalRadius),
                      borderSide: BorderSide.none,
                    ),
                    // Password visibility toggle button
                    suffixIcon: IconButton(
                      onPressed: signIn.changeShowPassword,
                      icon: Icon(
                        // Show appropriate icon based on visibility state
                        signIn.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  // Hide password characters based on visibility state
                  obscureText: !signIn.isShowPassword,
                  // Complete form when done
                  textInputAction: TextInputAction.done,
                  // Password strength validation
                  validator: FormValidation.validatePassword,
                ),
          ),
        ],
      ),
    );
  }
}
