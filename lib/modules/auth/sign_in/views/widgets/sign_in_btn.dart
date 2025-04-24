part of '../sign_in_view.dart';

class _SignInBtn extends StatelessWidget {
  const _SignInBtn();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<SignInCubit>();
    return BlocListener<SignInCubit, SignInState>(
      listener: _listener,
      child: FilledButton(
        onPressed: () {
          final isValid = cubit.formKey.currentState!.validate();
          if (isValid) {
            final signInRequestModel = SignInRequestModel(
              email: cubit.email.text,
              password: cubit.password.text,
            );
            cubit.signIn(signInRequestModel);
          }
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width, kBottonHight),
          ),
        ),
        child: Text(language.sign_in, style: TextStyles.ts12B),
      ),
    );
  }
}
