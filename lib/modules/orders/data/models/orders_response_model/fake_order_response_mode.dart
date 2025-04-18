import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

const List<OrdersDatum> fakeOrdersResponseModel = [
  _orderDatum,
  _orderDatum,
  _orderDatum,
];

const _orderDatum = OrdersDatum(
  aramexId: 0,
  countryModel: CountryModel.global,
  id: 1,
  createdAt: '2023-03-07 03:27:18.684103',
  status: OrderStatus.requested,
  bookingDate: '2025-03-07 03:27:18.684103',
  paymentType: OrderPaymentType.cash,
  phone: '+2012345678',
  requestNumber: '123456789',
  userName: 'John Doe',
);
