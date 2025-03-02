part of '../one_order_view.dart';

class _GeneralBody extends StatelessWidget {
  const _GeneralBody({required this.orderItem});
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(
          leading: Icon(CupertinoIcons.cube_box_fill),
          title: Text(language.general_info),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              ListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text(orderItem.cart.user.name),
                subtitle: Text(language.client_name),
              ),
              Divider(),
              ListTile(
                leading: Icon(CupertinoIcons.phone),
                title: Text(orderItem.cart.user.phone),
                subtitle: Text(language.client_number),
                trailing: IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: orderItem.cart.user.phone),
                    );
                  },
                  icon: Icon(Icons.copy),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(CupertinoIcons.location),
                title: Text(
                  orderItem.address == null
                      ? language.no_info
                      : orderItem.address!.addressName,
                  maxLines: 2,
                ),
                subtitle: Text(language.address),
              ),
              Divider(),
              _OrderStateSteps(),
            ],
          ),
        ),
      ],
    );
  }
}
