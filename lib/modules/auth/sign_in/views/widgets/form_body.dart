part of '../sign_in_view.dart';

class _FormBody extends StatelessWidget {
  const _FormBody();

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final signIn = context.read<SignInCubit>();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: signIn.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: signIn.email,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              prefixIcon: Icon(Icons.email),
              hintText: language.email,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kNormalRadius),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) => FormValidation.validateEmail(value),
          ),
          SizedBox(height: kSpacingBetweenWidgetsHight),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return TextFormField(
                controller: signIn.password,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  hintText: language.password,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kNormalRadius),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      signIn.changeShowPassword();
                    },
                    icon: Icon(
                      signIn.isShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: !signIn.isShowPassword,
                textInputAction: TextInputAction.done,
                validator: (value) => FormValidation.validatePassword(value),
              );
            },
          ),
        ],
      ),
    );
  }
}
