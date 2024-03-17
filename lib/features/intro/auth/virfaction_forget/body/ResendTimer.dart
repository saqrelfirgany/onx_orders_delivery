import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/components/loading/main_loaing.dart';
import '../../../../../core/theme/custom_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../verification_cubit.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key, required this.cubit});

  final VerificationCubit cubit;

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  int _secondsRemaining = 0;
  late Timer _timer;
  bool isResend = false;

  @override
  void initState() {
    super.initState();
    // Initialize the timer with the desired duration (in seconds)
    _startTimer(60);
  }

  void _startTimer(int seconds) {
    _secondsRemaining = seconds;
    // Create a timer that runs every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Decrement the remaining seconds
        _secondsRemaining--;

        // If the timer reaches 0, cancel the timer
        if (_secondsRemaining <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  Future<void> _resendCode() async {
    log('_secondsRemaining:::$_secondsRemaining');
    if (_secondsRemaining == 0) {
      isResend = true;
      setState(() {});
      await widget.cubit.sendOTP(context: context);
      _timer.cancel();
      _startTimer(60);
      isResend = false;
      setState(() {});
    } else {
      return;
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return isResend
        ? MainLoading(size: 26)
        : GestureDetector(
            onTap: () {
              _resendCode();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.re,
                        style: CustomTextStyles.titleMediumBluegray70001_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "-",
                        style: CustomTextStyles.titleMediumBluegray70001_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: l10n.sendCode,
                        style: CustomTextStyles.titleMediumBluegray70001_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "$_secondsRemaining",
                        style: CustomTextStyles.titleMediumBluegray70001_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: l10n.s,
                        style: CustomTextStyles.titleMediumBluegray70001_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          );
  }
}
