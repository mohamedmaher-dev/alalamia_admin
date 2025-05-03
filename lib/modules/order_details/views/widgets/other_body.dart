part of '../one_order_view.dart';

class _OtherBody extends StatelessWidget {
  const _OtherBody();
  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.more_rounded),
          title: Text(language.other_info),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.money_dollar),
                title: Text(args.paymentType.paymentTypeText),
                subtitle: Text(language.payment_type),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.delivery_dining),
                title: Text(
                  args.aramexId == null
                      ? language.no_data
                      : args.aramexId.toString(),
                ),
                subtitle: Text(language.aramex_number),
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
