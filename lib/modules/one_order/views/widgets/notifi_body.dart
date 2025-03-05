part of '../one_order_view.dart';

class _NotifiBody extends StatelessWidget {
  const _NotifiBody({required this.fcmCubit, required this.fcmToken});
  final String fcmToken;
  final FcmCubit fcmCubit;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return BlocListener<FcmCubit, FcmState>(
      listener: fcmListener,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          key: fcmCubit.formKey,
          child: Column(
            spacing: kSpacingBetweenWidgetsHight,
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.bell),
                title: Text(language.notifications, style: TextStyles.tsP15B),
                subtitle: Text(language.please_input_the_title_and_body),
              ),
              TextFormField(
                validator: (value) => FormValidation.validateFcmFields(value),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kNormalRadius),
                    borderSide: BorderSide.none,
                  ),
                  hintText: language.title_of_notification,
                ),
              ),
              TextFormField(
                validator: (value) => FormValidation.validateFcmFields(value),
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kNormalRadius),
                    borderSide: BorderSide.none,
                  ),
                  hintText: language.body_of_notification,
                ),
              ),
              GeneralBtn(
                title: language.send_notification,
                onPressed: () {
                  fcmCubit.sendFcm(fcmToken);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
