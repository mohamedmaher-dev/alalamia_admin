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
  InvoiceCubit() : super(const InvoiceState.initial());
  Future<void> show(
    final OrdersDetailsResponseModel order,
    final OrdersDatum args,
  ) async {
    emit(const InvoiceState.showLoading());
    final result = await invoiceRebo.createPdfData(order, args);
    result.when(
      success:
          (final data) => emit(
            InvoiceState.showSuccess(pdfData: data, cubit: this, order: order),
          ),
      failure: (final e) => emit(const InvoiceState.showFailure()),
    );
  }

  Future<void> save(
    final OrdersDetailsResponseModel order,
    final Uint8List pdf,
  ) async {
    emit(const InvoiceState.saveLoading());
    final result = await invoiceRebo.saveInvoice(order, pdf);
    result.when(
      success: (_) => emit(const InvoiceState.saveSuccess()),
      failure: (final e) => emit(const InvoiceState.saveFailure()),
    );
  }
}
