import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';

const List<OrderItem> fakeOrderResponse = [_orderItem, _orderItem, _orderItem];

const OrderItem _orderItem = OrderItem(
  orderId: 104,
  requestNumber: "REQ12348",
  isActive: 0,
  orderDate: '2025-02-13 03:11:53.152304',
  cart: Cart(
    priceSum: 500,
    items: [
      CartItem(
        itemPrice: "500",
        orderAvailability: 1,
        productId: 50,
        productName: "USB-C Hub",
        pivot: Pivot(quantity: "1"),
      ),
    ],
    user: Client(
      id: 4,
      name: "Sarah Lee",
      email: "sarah.lee@example.com",
      phone: "+444555666",
      fcm: "dummy_fcm_token_4",
      imagePath: "https://example.com/sarah.jpg",
      wallet: ClientWallet(currencyName: "USD"),
    ),
  ),
  address: ClientAddress(
    addressName: "Apartment",
    addressDesc: "789 Highrise Ave, City",
    lat: "34.0522",
    lng: "-118.2437",
  ),
);
