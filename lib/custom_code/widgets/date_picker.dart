import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.labelText = ' ',
    this.labelColor = const Color(0xFFF25822),
    this.pickerTextColor,
    this.backgroundColor,
    this.pickerBackgroundColor,
    this.minDate,
    this.maxDate,
    this.defaultDate,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onChange,
    this.readOnly = false,
  });

  final double width;
  final double height;
  final String labelText;
  final Color labelColor;
  final Color? pickerTextColor;
  final Color? backgroundColor;
  final Color? pickerBackgroundColor;
  final DateTime? minDate;
  final DateTime? maxDate;
  final DateTime? defaultDate;
  final Future Function(DateTime value) onChange;
  final bool? readOnly;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _value;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        if (widget.defaultDate != null) {
          _value = widget.defaultDate;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        if (widget.readOnly ?? false) {
          return;
        }

        final _datePickedCupertinoTheme = CupertinoTheme.of(context);

        await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              child: CupertinoTheme(
                data: _datePickedCupertinoTheme.copyWith(
                  textTheme: _datePickedCupertinoTheme.textTheme.copyWith(
                    dateTimePickerTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: Color.fromARGB(255, 0, 0, 0),
                              letterSpacing: 0.0,
                            ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: widget.minDate ?? DateTime(1900),
                  initialDateTime: _value,
                  maximumDate: widget.maxDate ?? DateTime(2090),
                  backgroundColor: Colors.transparent,
                  onDateTimeChanged: (newDateTime) {
                    setState(() {
                      _value = newDateTime;
                    });
                    widget.onChange.call(newDateTime);
                  },
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  _value != null
                      ? dateTimeFormat(
                          "d-MM-y",
                          _value,
                          locale: FFLocalizations.of(context).languageCode,
                        )
                      : FFLocalizations.of(context).getVariableText(
                          trText: 'Tarih Seçiniz',
                          enText: 'Select Date',
                        ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: Color.fromARGB(255, 117, 117, 117),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
