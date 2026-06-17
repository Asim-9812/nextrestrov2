import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

enum ToasterType {
  success,
  error,
  warning,
  info,
}

class Toaster {
  static void show({
    required BuildContext context,
    required String message,
    ToasterType type = ToasterType.info,
    Duration duration = const Duration(seconds: 3),
    bool isLandscape = false,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => _ToasterWidget(
        message: message,
        type: type,
        duration: duration,
        isLandscape: isLandscape,
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }

  static void success({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isLandscape = false,
  }) {
    show(
      context: context,
      message: message,
      type: ToasterType.success,
      duration: duration,
      isLandscape: isLandscape,
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isLandscape = false,
  }) {
    show(
      context: context,
      message: message,
      type: ToasterType.error,
      duration: duration,
      isLandscape: isLandscape,
    );
  }

  static void warning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isLandscape = false,
  }) {
    show(
      context: context,
      message: message,
      type: ToasterType.warning,
      duration: duration,
      isLandscape: isLandscape,
    );
  }

  static void info({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isLandscape = false,
  }) {
    show(
      context: context,
      message: message,
      type: ToasterType.info,
      duration: duration,
      isLandscape: isLandscape,
    );
  }
}

class _ToasterWidget extends StatefulWidget {
  final String message;
  final ToasterType type;
  final Duration duration;
  final bool isLandscape;

  const _ToasterWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.isLandscape,
  });

  @override
  State<_ToasterWidget> createState() => _ToasterWidgetState();
}

class _ToasterWidgetState extends State<_ToasterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    switch (widget.type) {
      case ToasterType.success:
        return AppColors.success;
      case ToasterType.error:
        return AppColors.error;
      case ToasterType.warning:
        return AppColors.warning;
      case ToasterType.info:
        return AppColors.info;
    }
  }

  IconData _getIcon() {
    switch (widget.type) {
      case ToasterType.success:
        return Icons.check_circle_rounded;
      case ToasterType.error:
        return Icons.error_rounded;
      case ToasterType.warning:
        return Icons.warning_rounded;
      case ToasterType.info:
        return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: widget.isLandscape ? null : 20,
      right: 20,
      child: Align(
        alignment: widget.isLandscape ? Alignment.bottomRight : Alignment.bottomCenter,
        child: SizedBox(
          width: widget.isLandscape ? 300 : double.infinity,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: _getBackgroundColor(),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: _getBackgroundColor().withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getIcon(),
                        color: AppColors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
