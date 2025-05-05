part of '../one_order_view.dart';

class _OtherBody extends StatelessWidget {
  const _OtherBody();
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final args = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.more_rounded),
          title: Text(language.other_info, style: theme.textTheme.titleLarge),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              CustomListTile(
                icon: const Icon(CupertinoIcons.money_dollar),
                title: args.paymentType.paymentTypeText,
                subTitle: language.payment_type,
              ),
              CustomListTile(
                icon: const Icon(Icons.delivery_dining),
                title:
                    args.aramexId == null
                        ? language.no_data
                        : args.aramexId.toString(),

                subTitle: language.aramex_number,
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: args.aramexId.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
