part of '../one_order_view.dart';

class _GeneralBody extends StatelessWidget {
  const _GeneralBody();

  @override
  Widget build(BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.person_circle_fill),
            title: Text(language.client_info, style: TextStyles.ts15B),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(CupertinoIcons.person),
                  title: Text(args.userName),
                  subtitle: Text(language.client_name),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(CupertinoIcons.phone),
                  title: Text(args.phone),
                  subtitle: Text(language.client_number),
                  trailing: IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: args.phone));
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.cube_box_fill),
            title: Text(language.order_summary, style: TextStyles.ts15B),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                _OrderStateSteps(
                  orderStatus: args.status,
                  orderId: args.id.toString(),
                ),
                if (args.status != OrderStatus.canceled)
                  Container(
                    padding: EdgeInsets.all(kNormalPadding),
                    decoration: BoxDecoration(
                      color: ColorManger.scaffoldColor,
                      borderRadius: BorderRadius.circular(kNormalRadius),
                    ),
                    child: Text(
                      language.click_to_change_status,
                      style: TextStyles.ts10N.copyWith(color: Colors.grey),
                    ),
                  ),
                const Divider(),
                ListTile(
                  leading: const Icon(CupertinoIcons.number),
                  title: Text(args.requestNumber),
                  subtitle: Text(language.order_number),
                  trailing: IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: args.requestNumber),
                      );
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
