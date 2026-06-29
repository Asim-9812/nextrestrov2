import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class ResendOtpTimer extends StatefulWidget {
  final VoidCallback onResend;
  final int initialSeconds;

  const ResendOtpTimer({
    super.key,
    required this.onResend,
    this.initialSeconds = 90,
  });

  @override
  State<ResendOtpTimer> createState() => _ResendOtpTimerState();
}

class _ResendOtpTimerState extends State<ResendOtpTimer> {
  late int _secondsRemaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = widget.initialSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final bool canResend = _secondsRemaining == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!canResend)
          Text(
            'Resend code in ',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grey.withValues(alpha: 0.8),
            ),
          ),
        TextButton(
          onPressed: canResend
              ? () {
                  widget.onResend();
                  _startTimer();
                }
              : null,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            canResend ? 'Resend Code' : _formatTime(_secondsRemaining),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: canResend ? AppColors.primary : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
