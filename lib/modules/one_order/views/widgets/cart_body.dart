part of '../one_order_view.dart';

// class _CartBody extends StatelessWidget {
//   const _CartBody({required this.orderItem});
//   final OrderItem orderItem;
//   @override
//   Widget build(BuildContext context) {
//     final language = Language.of(context);
//     return Column(
//       children: [
//         Divider(),

//         Card(
//           margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
//           child: ListView.separated(
//             physics: const NeverScrollableScrollPhysics(),
//             separatorBuilder: (context, index) => const Divider(),
//             shrinkWrap: true,
//             itemBuilder:
//                 (context, index) => ListTile(
//                   leading: Text(orderItem.cart.items[index].pivot.quantity),
//                   title: Text(orderItem.cart.items[index].productName),
//                   subtitle: Text(language.product_name),
//                   trailing: Text(
//                     "${orderItem.cart.items[index].itemPrice} ${orderItem.cart.user.wallet.currencyName}",
//                   ),
//                 ),
//             itemCount: orderItem.cart.items.length,
//           ),
//         ),
//       ],
//     );
//   }
// }
