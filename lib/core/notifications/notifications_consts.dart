/// Firebase Cloud Messaging (FCM) topic constants for push notifications
/// Defines notification topics for different environments and user roles
/// Used for subscribing admins to relevant notification channels
class NotificationsConsts {
  // Private constructor to prevent instantiation of this utility class
  NotificationsConsts._();

  /// Production FCM topic for admin notifications
  /// All admin users subscribe to this topic to receive order and system updates
  static const String adminTopic = 'MatjerAlalmiAdmin';

  /// Debug/development FCM topic for testing notifications
  /// Used during development and testing phases to avoid affecting production users
  static const String adminTopicDebug = 'MatjerAlalmiaDebug';
}
