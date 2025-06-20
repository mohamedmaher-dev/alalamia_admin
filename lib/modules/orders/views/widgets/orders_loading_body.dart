part of '../orders_view.dart';

/// Loading state widget for orders list with skeleton animation
/// Displays fake order items with shimmer effect while data is being fetched
/// Provides smooth user experience during initial loading and refresh operations
class _OrdersLoadingBody extends StatelessWidget {
  const _OrdersLoadingBody();

  /// Fake order data model used for skeleton loading animation
  /// Provides realistic layout structure during loading state
  final OrdersDatum item = fakeOrdersResponseModel;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    // Disable scrolling during loading to prevent user interaction
    physics: const NeverScrollableScrollPhysics(),
    child: Column(
      children: List.generate(
        // Generate 5 skeleton items to fill the screen naturally
        5,
        (final index) =>
        // Create order item with loading state enabled for skeleton animation
        _OrderItemBody(index: index, model: item, isLoading: true),
      ),
    ),
  );
}
