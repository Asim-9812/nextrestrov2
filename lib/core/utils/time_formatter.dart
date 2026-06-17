import 'package:intl/intl.dart';

class TimeFormatter {
  static String formatTimeAgo(String? dateTimeStr) {
    if (dateTimeStr == null) return '';
    final dateTime = DateTime.tryParse(dateTimeStr);
    if (dateTime == null) return '';

    final diff = DateTime.now().difference(dateTime);

    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}min ago';
    if (diff.inHours < 24) return '${diff.inHours}hr ago';
    if (diff.inDays < 30) return '${diff.inDays}d ago';
    
    // Simple month/year calculation
    if (diff.inDays < 365) {
      final months = (diff.inDays / 30).floor();
      return '${months}mon ago';
    }
    
    final years = (diff.inDays / 365).floor();
    return '${years}yr ago';
  }

  static String formatFullDate(String? dateTimeStr) {
    if (dateTimeStr == null) return '';
    final dateTime = DateTime.tryParse(dateTimeStr);
    if (dateTime == null) return '';
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }
}
