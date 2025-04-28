import 'dart:typed_data';

import 'package:alalamia_admin/modules/invoice/repos/invoice_repo.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'invoice_state.dart';
part 'invoice_cubit.freezed.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepo invoiceRepo = InvoiceRepo();
  InvoiceCubit() : super(const InvoiceState.initial());
  Future<void> show(
    final OrdersDetailsResponseModel order,
    final OrdersDatum args,
  ) async {
    emit(const InvoiceState.showLoading());
    final result = await invoiceRepo.createPdfData(order, args);
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
    final result = await invoiceRepo.saveInvoice(order, pdf);
    result.when(
      success: (final file) => emit(InvoiceState.saveSuccess(file: file)),
      failure: (final e) => emit(const InvoiceState.saveFailure()),
    );
  }
}
