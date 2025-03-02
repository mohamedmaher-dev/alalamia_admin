import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void Function(BuildContext, InvoiceState) inVoiceListener = (context, state) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    showLoading: () => PopLoading.show(),
    showSuccess:
        (pdfData, cubit, order) => showModalBottomSheet(
          context: context,
          builder:
              (context) => Scaffold(
                body: SfPdfViewer.memory(pdfData),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    cubit.save(order, pdfData);
                  },
                  child: const Icon(Icons.save),
                ),
              ),
        ),
    showFailure:
        () => AppSnackBar.show(
          context,
          msg: language.failure_to_make_invoice,
          type: ContentType.failure,
        ),
    saveLoading: () => PopLoading.show(),
    saveSuccess: () {
      AppRouter.pop();
      AppSnackBar.show(
        context,
        msg: language.invoice_saved_successfully,
        type: ContentType.success,
      );
    },
    saveFailure:
        () => AppSnackBar.show(
          context,
          msg: language.failure_to_save_invoice,
          type: ContentType.failure,
        ),
  );
};
