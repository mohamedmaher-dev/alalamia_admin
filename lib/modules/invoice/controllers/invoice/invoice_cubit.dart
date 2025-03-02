import 'dart:typed_data';

import 'package:alalamia_admin/modules/invoice/rebos/invoice_rebo.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_state.dart';
part 'invoice_cubit.freezed.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRebo invoiceRebo = InvoiceRebo();
  InvoiceCubit() : super(InvoiceState.initial());
  Future<void> show(OrderItem orderItem) async {
    emit(InvoiceState.showLoading());
    final result = await invoiceRebo.createPdfData(orderItem);
    result.when(
      success:
          (data) => emit(
            InvoiceState.showSuccess(
              pdfData: data,
              cubit: this,
              orderItem: orderItem,
            ),
          ),
      failure: (e) => emit(InvoiceState.showFailure()),
    );
  }

  Future<void> save(OrderItem orderItem, Uint8List pdf) async {
    emit(InvoiceState.saveLoading());
    final result = await invoiceRebo.saveInvoice(orderItem, pdf);
    result.when(
      success: (_) => emit(InvoiceState.saveSuccess()),
      failure: (e) => emit(InvoiceState.saveFailure()),
    );
  }
}
