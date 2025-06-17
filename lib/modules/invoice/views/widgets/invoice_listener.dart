import 'dart:io';

import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Global listener function for handling PDF invoice generation and sharing operations
/// Manages the complete invoice workflow including generation, preview, saving, and sharing
/// Provides modal PDF viewer with share functionality for generated invoices
void Function(BuildContext, InvoiceState) inVoiceListener = (
  final context,
  final state,
) {
  final language = Language.of(context);

  // Always dismiss existing loading overlay to prevent stacking
  PopLoading.dismiss();

  state.whenOrNull(
    // Show loading overlay during PDF generation process
    showLoading: () => PopLoading.show(),

    // Display generated PDF in modal viewer with share option
    showSuccess:
        (final pdfData, final cubit, final order) => showModalBottomSheet(
          showDragHandle: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder:
              (final context) => Scaffold(
                // Syncfusion PDF viewer for displaying generated invoice
                body: SfPdfViewer.memory(pdfData),
                // Floating action button for saving and sharing PDF
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    // Initiate save operation for PDF sharing
                    cubit.save(order, pdfData);
                  },
                  // Platform-specific share icon (iOS vs Android)
                  child: Icon(
                    Platform.isIOS ? CupertinoIcons.share_solid : Icons.share,
                  ),
                ),
              ),
        ),

    // Handle PDF generation failure
    showFailure:
        () => AppSnackBar.show(
          msg: language.failure_to_make_invoice,
          type: ContentType.failure,
        ),

    // Show loading during PDF save operation
    saveLoading: () {
      // Close PDF preview modal first
      context.router.pop();
      // Show loading for save operation
      PopLoading.show();
    },

    // Handle successful PDF save and initiate sharing
    saveSuccess: (final file) async {
      // Create share parameters with the saved PDF file
      final params = ShareParams(files: [file]);
      // Open system share dialog for the PDF invoice
      await SharePlus.instance.share(params);
    },

    // Handle PDF save failure
    saveFailure:
        () => AppSnackBar.show(
          msg: language.failure_to_save_invoice,
          type: ContentType.failure,
        ),
  );
};
