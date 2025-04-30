import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void Function(BuildContext, InvoiceState) inVoiceListener = (
  final context,
  final state,
) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    showLoading: () => PopLoading.show(),
    showSuccess:
        (final pdfData, final cubit, final order) => showModalBottomSheet(
          showDragHandle: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder:
              (final context) => Scaffold(
                body: SfPdfViewer.memory(pdfData),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    cubit.save(order, pdfData);
                  },
                  child: const Icon(Icons.save_alt_rounded),
                ),
              ),
        ),
    showFailure:
        () => AppSnackBar.show(
          msg: language.failure_to_make_invoice,
          type: ContentType.failure,
        ),
    saveLoading: () {
      context.router.pop();
      PopLoading.show();
    },
    saveSuccess: (final file) async {
      AppSnackBar.show(
        msg: language.invoice_saved_successfully,
        type: ContentType.success,
      );
      final params = ShareParams(files: [file]);
      await SharePlus.instance.share(params);
    },
    saveFailure:
        () => AppSnackBar.show(
          msg: language.failure_to_save_invoice,
          type: ContentType.failure,
        ),
  );
};
