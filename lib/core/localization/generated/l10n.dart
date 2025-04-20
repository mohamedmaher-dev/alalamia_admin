// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Language {
  Language();

  static Language? _current;

  static Language get current {
    assert(_current != null,
        'No instance of Language was loaded. Try to initialize the Language delegate before accessing Language.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Language> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Language();
      Language._current = instance;

      return instance;
    });
  }

  static Language of(BuildContext context) {
    final instance = Language.maybeOf(context);
    assert(instance != null,
        'No instance of Language present in the widget tree. Did you add Language.delegate in localizationsDelegates?');
    return instance!;
  }

  static Language? maybeOf(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  /// `العربية`
  String get language_name {
    return Intl.message(
      'العربية',
      name: 'language_name',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا بعودتك`
  String get welcome_back {
    return Intl.message(
      'مرحبا بعودتك',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `برجاء ادخال بياناتك لتسجيل الدخول`
  String get please_input_your_data_to_sign_in {
    return Intl.message(
      'برجاء ادخال بياناتك لتسجيل الدخول',
      name: 'please_input_your_data_to_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `البريد الالكتروني`
  String get email {
    return Intl.message(
      'البريد الالكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get sign_in {
    return Intl.message(
      'تسجيل الدخول',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `نجاح`
  String get success {
    return Intl.message(
      'نجاح',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `فشل`
  String get failure {
    return Intl.message(
      'فشل',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن ترك البريد الالكتروني فارغ`
  String get you_cannot_leave_the_email_empty {
    return Intl.message(
      'لا يمكن ترك البريد الالكتروني فارغ',
      name: 'you_cannot_leave_the_email_empty',
      desc: '',
      args: [],
    );
  }

  /// `ادخل بريد الكتروني صحيح`
  String get enter_a_valid_email {
    return Intl.message(
      'ادخل بريد الكتروني صحيح',
      name: 'enter_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن ترك كلمة المرور فارغة`
  String get you_cannot_leave_the_password_empty {
    return Intl.message(
      'لا يمكن ترك كلمة المرور فارغة',
      name: 'you_cannot_leave_the_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب ان تكون على الاقل 8 حروف`
  String get password_must_be_at_least_8_characters {
    return Intl.message(
      'كلمة المرور يجب ان تكون على الاقل 8 حروف',
      name: 'password_must_be_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الدخول بنجاح`
  String get you_have_logged_in_successfully {
    return Intl.message(
      'تم تسجيل الدخول بنجاح',
      name: 'you_have_logged_in_successfully',
      desc: '',
      args: [],
    );
  }

  /// `تصفية`
  String get filter {
    return Intl.message(
      'تصفية',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `ترتيب`
  String get sort {
    return Intl.message(
      'ترتيب',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `طلب`
  String get order {
    return Intl.message(
      'طلب',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `اسم العميل`
  String get client_name {
    return Intl.message(
      'اسم العميل',
      name: 'client_name',
      desc: '',
      args: [],
    );
  }

  /// `رقم العميل`
  String get client_number {
    return Intl.message(
      'رقم العميل',
      name: 'client_number',
      desc: '',
      args: [],
    );
  }

  /// `رقم الطلب`
  String get order_number {
    return Intl.message(
      'رقم الطلب',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `عدد المنتجات`
  String get count_of_products {
    return Intl.message(
      'عدد المنتجات',
      name: 'count_of_products',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الطلب`
  String get order_date {
    return Intl.message(
      'تاريخ الطلب',
      name: 'order_date',
      desc: '',
      args: [],
    );
  }

  /// `ابحث هنا`
  String get search_here {
    return Intl.message(
      'ابحث هنا',
      name: 'search_here',
      desc: '',
      args: [],
    );
  }

  /// `الطلبات`
  String get orders {
    return Intl.message(
      'الطلبات',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `طلبات خارجية`
  String get extirnal_orders {
    return Intl.message(
      'طلبات خارجية',
      name: 'extirnal_orders',
      desc: '',
      args: [],
    );
  }

  /// `الاعدادات`
  String get settings {
    return Intl.message(
      'الاعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `عام`
  String get general {
    return Intl.message(
      'عام',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `الوضع الليلي`
  String get night_mode {
    return Intl.message(
      'الوضع الليلي',
      name: 'night_mode',
      desc: '',
      args: [],
    );
  }

  /// `اللغة الحالية`
  String get current_language {
    return Intl.message(
      'اللغة الحالية',
      name: 'current_language',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get my_profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get log_out {
    return Intl.message(
      'تسجيل الخروج',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `الصفحة الرئيسية`
  String get home_page {
    return Intl.message(
      'الصفحة الرئيسية',
      name: 'home_page',
      desc: '',
      args: [],
    );
  }

  /// `منتج`
  String get product {
    return Intl.message(
      'منتج',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `الغاء`
  String get cancel {
    return Intl.message(
      'الغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `هل انت متاكد انك تريد تسجيل الخروج؟`
  String get are_you_sure_you_want_to_log_out {
    return Intl.message(
      'هل انت متاكد انك تريد تسجيل الخروج؟',
      name: 'are_you_sure_you_want_to_log_out',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد صلاحية`
  String get permission_not_granted {
    return Intl.message(
      'لا يوجد صلاحية',
      name: 'permission_not_granted',
      desc: '',
      args: [],
    );
  }

  /// `فشل إنشاء الفاتورة`
  String get failure_to_make_invoice {
    return Intl.message(
      'فشل إنشاء الفاتورة',
      name: 'failure_to_make_invoice',
      desc: '',
      args: [],
    );
  }

  /// `تم حفظ الفاتورة بنجاح`
  String get invoice_saved_successfully {
    return Intl.message(
      'تم حفظ الفاتورة بنجاح',
      name: 'invoice_saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `فشل حفظ الفاتورة`
  String get failure_to_save_invoice {
    return Intl.message(
      'فشل حفظ الفاتورة',
      name: 'failure_to_save_invoice',
      desc: '',
      args: [],
    );
  }

  /// `السلة`
  String get the_cart {
    return Intl.message(
      'السلة',
      name: 'the_cart',
      desc: '',
      args: [],
    );
  }

  /// `اسم المنتج`
  String get product_name {
    return Intl.message(
      'اسم المنتج',
      name: 'product_name',
      desc: '',
      args: [],
    );
  }

  /// `السعر الكلي`
  String get total_price {
    return Intl.message(
      'السعر الكلي',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `الفاتورة`
  String get invoice {
    return Intl.message(
      'الفاتورة',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get confirm {
    return Intl.message(
      'تأكيد',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `معلومات عامة`
  String get general_info {
    return Intl.message(
      'معلومات عامة',
      name: 'general_info',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد معلومات`
  String get no_info {
    return Intl.message(
      'لا يوجد معلومات',
      name: 'no_info',
      desc: '',
      args: [],
    );
  }

  /// `فشل إرسال الإشعار`
  String get failure_to_send_notification {
    return Intl.message(
      'فشل إرسال الإشعار',
      name: 'failure_to_send_notification',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال الإشعار بنجاح`
  String get notification_sent_successfully {
    return Intl.message(
      'تم إرسال الإشعار بنجاح',
      name: 'notification_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن ترك هذا الحقل فارغ`
  String get you_cannot_leave_this_field_empty {
    return Intl.message(
      'لا يمكن ترك هذا الحقل فارغ',
      name: 'you_cannot_leave_this_field_empty',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال العنوان والنص`
  String get please_input_the_title_and_body {
    return Intl.message(
      'الرجاء إدخال العنوان والنص',
      name: 'please_input_the_title_and_body',
      desc: '',
      args: [],
    );
  }

  /// `عنوان الإشعار`
  String get title_of_notification {
    return Intl.message(
      'عنوان الإشعار',
      name: 'title_of_notification',
      desc: '',
      args: [],
    );
  }

  /// `محتوى الإشعار`
  String get body_of_notification {
    return Intl.message(
      'محتوى الإشعار',
      name: 'body_of_notification',
      desc: '',
      args: [],
    );
  }

  /// `إرسال الإشعار`
  String get send_notification {
    return Intl.message(
      'إرسال الإشعار',
      name: 'send_notification',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد بيانات`
  String get no_data {
    return Intl.message(
      'لا يوجد بيانات',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `محفظة العالمية`
  String get alalmia_wallet {
    return Intl.message(
      'محفظة العالمية',
      name: 'alalmia_wallet',
      desc: '',
      args: [],
    );
  }

  /// `نقدًا`
  String get cash {
    return Intl.message(
      'نقدًا',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `باي بال`
  String get paypal {
    return Intl.message(
      'باي بال',
      name: 'paypal',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة`
  String get card {
    return Intl.message(
      'بطاقة',
      name: 'card',
      desc: '',
      args: [],
    );
  }

  /// `طريقة الدفع`
  String get payment_type {
    return Intl.message(
      'طريقة الدفع',
      name: 'payment_type',
      desc: '',
      args: [],
    );
  }

  /// `قيد المراجعة`
  String get status_review {
    return Intl.message(
      'قيد المراجعة',
      name: 'status_review',
      desc: '',
      args: [],
    );
  }

  /// `تمت الموافقة`
  String get status_approved {
    return Intl.message(
      'تمت الموافقة',
      name: 'status_approved',
      desc: '',
      args: [],
    );
  }

  /// `قيد التجهيز`
  String get status_preparing {
    return Intl.message(
      'قيد التجهيز',
      name: 'status_preparing',
      desc: '',
      args: [],
    );
  }

  /// `في الطريق`
  String get status_on_the_way {
    return Intl.message(
      'في الطريق',
      name: 'status_on_the_way',
      desc: '',
      args: [],
    );
  }

  /// `تم التوصيل`
  String get status_delivered {
    return Intl.message(
      'تم التوصيل',
      name: 'status_delivered',
      desc: '',
      args: [],
    );
  }

  /// `تم الالغاء`
  String get status_canceled {
    return Intl.message(
      'تم الالغاء',
      name: 'status_canceled',
      desc: '',
      args: [],
    );
  }

  /// `معلومات أخرى`
  String get other_info {
    return Intl.message(
      'معلومات أخرى',
      name: 'other_info',
      desc: '',
      args: [],
    );
  }

  /// `موافقة`
  String get approve {
    return Intl.message(
      'موافقة',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `رفض`
  String get reject {
    return Intl.message(
      'رفض',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `وصف`
  String get description {
    return Intl.message(
      'وصف',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `وصف الموقع`
  String get location_desc {
    return Intl.message(
      'وصف الموقع',
      name: 'location_desc',
      desc: '',
      args: [],
    );
  }

  /// `مزيد من المعلومات`
  String get more_info {
    return Intl.message(
      'مزيد من المعلومات',
      name: 'more_info',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير حالة الطلب بنجاح`
  String get order_status_change_successfully {
    return Intl.message(
      'تم تغيير حالة الطلب بنجاح',
      name: 'order_status_change_successfully',
      desc: '',
      args: [],
    );
  }

  /// `فشل تغيير حالة الطلب`
  String get failure_to_change_order_status {
    return Intl.message(
      'فشل تغيير حالة الطلب',
      name: 'failure_to_change_order_status',
      desc: '',
      args: [],
    );
  }

  /// `موافقة على هذا الطلب`
  String get approve_this_order {
    return Intl.message(
      'موافقة على هذا الطلب',
      name: 'approve_this_order',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد موافقة على هذا الطلب؟`
  String get do_you_want_to_approve_this_order {
    return Intl.message(
      'هل تريد موافقة على هذا الطلب؟',
      name: 'do_you_want_to_approve_this_order',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء هذا الطلب`
  String get reject_this_order {
    return Intl.message(
      'إلغاء هذا الطلب',
      name: 'reject_this_order',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد إلغاء هذا الطلب؟`
  String get do_you_want_to_reject_this_order {
    return Intl.message(
      'هل تريد إلغاء هذا الطلب؟',
      name: 'do_you_want_to_reject_this_order',
      desc: '',
      args: [],
    );
  }

  /// `احصائيات`
  String get statistics {
    return Intl.message(
      'احصائيات',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `معلومات العميل`
  String get client_info {
    return Intl.message(
      'معلومات العميل',
      name: 'client_info',
      desc: '',
      args: [],
    );
  }

  /// `الكمية`
  String get quantity {
    return Intl.message(
      'الكمية',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `السعر`
  String get price {
    return Intl.message(
      'السعر',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `وحدة`
  String get unit {
    return Intl.message(
      'وحدة',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `تغيير الحالة`
  String get change_status {
    return Intl.message(
      'تغيير الحالة',
      name: 'change_status',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد أنك تريد تغيير حالة هذا الطلب؟`
  String get are_you_sure_you_want_to_change_this_order_status {
    return Intl.message(
      'هل أنت متأكد أنك تريد تغيير حالة هذا الطلب؟',
      name: 'are_you_sure_you_want_to_change_this_order_status',
      desc: '',
      args: [],
    );
  }

  /// `تحذير`
  String get warning {
    return Intl.message(
      'تحذير',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `هذه هي حالة الطلب الحالية`
  String get this_is_current_status_of_the_order {
    return Intl.message(
      'هذه هي حالة الطلب الحالية',
      name: 'this_is_current_status_of_the_order',
      desc: '',
      args: [],
    );
  }

  /// `- اضغط لتغيير الحالة -`
  String get click_to_change_status {
    return Intl.message(
      '- اضغط لتغيير الحالة -',
      name: 'click_to_change_status',
      desc: '',
      args: [],
    );
  }

  /// `رقم شحنة آرامكس`
  String get aramex_number {
    return Intl.message(
      'رقم شحنة آرامكس',
      name: 'aramex_number',
      desc: '',
      args: [],
    );
  }

  /// `رقم الصنف`
  String get product_code {
    return Intl.message(
      'رقم الصنف',
      name: 'product_code',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ ما`
  String get something_went_wrong {
    return Intl.message(
      'حدث خطأ ما',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد طلبات`
  String get no_orders_found {
    return Intl.message(
      'لا يوجد طلبات',
      name: 'no_orders_found',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد طلبات أخرى`
  String get no_more_orders {
    return Intl.message(
      'لا يوجد طلبات أخرى',
      name: 'no_more_orders',
      desc: '',
      args: [],
    );
  }

  /// `السلة`
  String get cart {
    return Intl.message(
      'السلة',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `آخرى`
  String get other {
    return Intl.message(
      'آخرى',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `حالة الطلب`
  String get order_status {
    return Intl.message(
      'حالة الطلب',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `ملخص الطلب`
  String get order_summary {
    return Intl.message(
      'ملخص الطلب',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل الطلب`
  String get order_details {
    return Intl.message(
      'تفاصيل الطلب',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال بريدك الإلكتروني وكلمة المرور`
  String get please_input_your_email_and_password {
    return Intl.message(
      'الرجاء إدخال بريدك الإلكتروني وكلمة المرور',
      name: 'please_input_your_email_and_password',
      desc: '',
      args: [],
    );
  }

  /// `خطأ غير معروف`
  String get unknown_error {
    return Intl.message(
      'خطأ غير معروف',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الاتصال`
  String get connection_timeout {
    return Intl.message(
      'انتهاء مهلة الاتصال',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الإرسال`
  String get send_timeout {
    return Intl.message(
      'انتهاء مهلة الإرسال',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الاستلام`
  String get receive_timeout {
    return Intl.message(
      'انتهاء مهلة الاستلام',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `شهادة سيئة`
  String get bad_certificate {
    return Intl.message(
      'شهادة سيئة',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `تم الغاء الاتصال`
  String get connection_canceled {
    return Intl.message(
      'تم الغاء الاتصال',
      name: 'connection_canceled',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في الاتصال`
  String get connection_error {
    return Intl.message(
      'خطأ في الاتصال',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `فشل تسجيل الخروج`
  String get failed_to_sign_out {
    return Intl.message(
      'فشل تسجيل الخروج',
      name: 'failed_to_sign_out',
      desc: '',
      args: [],
    );
  }

  /// `الاذن غير ممنوح`
  String get perrmission_not_granted {
    return Intl.message(
      'الاذن غير ممنوح',
      name: 'perrmission_not_granted',
      desc: '',
      args: [],
    );
  }

  /// `الاذن ممنوح`
  String get perrmission_granted {
    return Intl.message(
      'الاذن ممنوح',
      name: 'perrmission_granted',
      desc: '',
      args: [],
    );
  }

  /// `منذ`
  String get time_ago {
    return Intl.message(
      'منذ',
      name: 'time_ago',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Language> load(Locale locale) => Language.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
