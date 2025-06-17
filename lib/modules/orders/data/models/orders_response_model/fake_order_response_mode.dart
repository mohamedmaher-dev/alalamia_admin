import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

/// Fake order data model used for skeleton loading animations and UI testing
/// Provides realistic sample data structure to maintain proper layout during loading states
/// Used by Skeletonizer widget to show placeholder content while actual data is being fetched
const fakeOrdersResponseModel = OrdersDatum(
  /// Delivery tracking ID placeholder
  aramexId: 0,

  /// Global country selection for international orders
  countryModel: CountryModel.global,

  /// Sample order ID for testing and layout purposes
  id: 1,

  /// Sample creation timestamp for date formatting testing
  createdAt: '2023-03-07 03:27:18.684103',

  /// Default order status for initial display
  status: OrderStatus.requested,

  /// Sample booking date for time calculation testing
  bookingDate: '2025-03-07 03:27:18.684103',

  /// Cash payment type for payment display testing
  paymentType: OrderPaymentType.cash,

  /// Sample phone number for contact info display
  phone: '+2012345678',

  /// Sample request number for order tracking display
  requestNumber: '123456789',

  /// Sample customer name for user avatar and display testing
  userName: 'John Doe',
);
