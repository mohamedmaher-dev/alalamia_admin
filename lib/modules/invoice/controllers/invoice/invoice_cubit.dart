import 'dart:typed_data';

import 'package:alalamia_admin/modules/invoice/rebos/invoice_rebo.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_state.dart';
part 'invoice_cubit.freezed.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRebo invoiceRebo = InvoiceRebo();
  InvoiceCubit() : super(InvoiceState.initial());
  Future<void> show(OrdersDetailsResponseModel order, OrdersDatum args) async {
    emit(InvoiceState.showLoading());
    final result = await invoiceRebo.createPdfData(order, args);
    result.when(
      success:
          (data) => emit(
            InvoiceState.showSuccess(pdfData: data, cubit: this, order: order),
          ),
      failure: (e) => emit(InvoiceState.showFailure()),
    );
  }

  Future<void> save(OrdersDetailsResponseModel order, Uint8List pdf) async {
    emit(InvoiceState.saveLoading());
    final result = await invoiceRebo.saveInvoice(order, pdf);
    result.when(
      success: (_) => emit(InvoiceState.saveSuccess()),
      failure: (e) => emit(InvoiceState.saveFailure()),
    );
  }
}
