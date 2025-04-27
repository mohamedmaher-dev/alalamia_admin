part of '../orders_view.dart';

// ignore: unused_element
class _FilterOrderBody extends StatelessWidget {
  const _FilterOrderBody({required this.ordersCount});
  final int ordersCount;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(kNormalPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kNormalRadius),
            color: ColorManger.myGold,
          ),
          child: Text(
            '$ordersCount ${language.orders}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        TextButton.icon(
          label: Text(language.filter),
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_outlined),
        ),

        TextButton.icon(
          label: Text(language.sort),
          onPressed: () {},
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
