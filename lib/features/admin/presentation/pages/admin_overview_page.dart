import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../injection_container.dart' as di;
import '../../../order/data/datasources/order_remote_data_source.dart';
import '../../../product/data/datasources/product_remote_data_source.dart';
import '../../../product/domain/entities/product.dart';
import '../../data/models/admin_order_model.dart';

class AdminOverviewPage extends StatefulWidget {
  final Function(int tabIndex)? onNavigateTab;

  const AdminOverviewPage({super.key, this.onNavigateTab});

  @override
  State<AdminOverviewPage> createState() => _AdminOverviewPageState();
}

class _AdminOverviewPageState extends State<AdminOverviewPage> {
  bool _isLoading = true;
  String? _errorMessage;

  List<AdminOrderModel> _allOrders = [];
  List<Product> _allProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchOverviewData();
  }

  Future<void> _fetchOverviewData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final ordersFuture = di.sl<OrderRemoteDataSource>().getAdminOrderList();
      final productsFuture = di.sl<ProductRemoteDataSource>().getAllProducts();

      final results = await Future.wait([ordersFuture, productsFuture]);

      if (!mounted) return;
      setState(() {
        _allOrders = results[0] as List<AdminOrderModel>;
        _allProducts = results[1] as List<Product>;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  // Filter: Recent orders that are NOT delivered (status != 5) and placed < 7 days ago
  List<AdminOrderModel> get _recentActiveOrders {
    final now = DateTime.now();
    return _allOrders.where((order) {
      final isNotDelivered = order.orderStatus != 5;
      final daysDiff = now.difference(order.orderDate).inDays;
      final isRecentLessThanAWeek = daysDiff <= 7 && daysDiff >= 0;
      return isNotDelivered && isRecentLessThanAWeek;
    }).toList();
  }

  // Revenue
  double get _totalRevenue {
    return _allOrders
        .where((o) => o.orderStatus != 4) // Exclude cancelled
        .fold(0.0, (sum, o) => sum + o.totalAmount);
  }

  // Order Counts
  int get _pendingCount => _allOrders.where((o) => o.orderStatus == 1).length;
  int get _confirmedCount => _allOrders.where((o) => o.orderStatus == 2).length;
  int get _outForDeliveryCount => _allOrders.where((o) => o.orderStatus == 3).length;
  int get _cancelledCount => _allOrders.where((o) => o.orderStatus == 4).length;
  int get _deliveredCount => _allOrders.where((o) => o.orderStatus == 5).length;

  // Stock Counts
  int get _outOfStockCount => _allProducts.where((p) => (p.availableQty ?? 0) <= 0).length;
  int get _lowStockCount => _allProducts.where((p) => (p.availableQty ?? 0) > 0 && (p.availableQty ?? 0) <= 10).length;
  int get _inStockCount => _allProducts.length - _outOfStockCount - _lowStockCount;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchOverviewData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner & Total Revenue
            _buildHeaderBanner(),
            AppSizes.gapH24,

            if (_isLoading)
              Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: const Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading analytics & overview...', style: TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
              )
            else if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 36),
                    const SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _fetchOverviewData,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Retry', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              )
            else ...[
              // 1. Merged Orders Overview Card (Pie Chart & Progress Bar)
              _buildOrdersOverviewCard(),
              AppSizes.gapH24,

              // 2. Merged Stock Health Card (Donut Chart & Breakdown)
              _buildStockOverviewCard(),
              AppSizes.gapH24,

              // 3. Recent Orders List (< 7 Days, Not Delivered)
              _buildRecentOrdersHeader(),
              AppSizes.gapH12,
              _buildRecentOrdersList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, Color(0xFF1E3A8A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin Dashboard',
                      style: AppTextStyles.h2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Live metrics, order breakdown, a1nd stock charts.',
                      style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: _fetchOverviewData,
              ),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Sales Revenue',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rs. ${_totalRevenue.toStringAsFixed(2)}',
                        style: AppTextStyles.h1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.trending_up, color: Colors.greenAccent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${_allOrders.length} Orders',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersOverviewCard() {
    final total = _allOrders.length;
    final values = [
      _pendingCount.toDouble(),
      _confirmedCount.toDouble(),
      _outForDeliveryCount.toDouble(),
      _deliveredCount.toDouble(),
      _cancelledCount.toDouble(),
    ];
    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.purple,
      Colors.green,
      Colors.red,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.donut_large_rounded, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Orders Distribution',
                            style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Total $total orders placed across system',
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary, fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (widget.onNavigateTab != null) widget.onNavigateTab!(1);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('View All', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Donut Chart & Side Summary
          Row(
            children: [
              // Donut Chart Widget
              SizedBox(
                width: 80,
                height: 80,
                child: CustomPaint(
                  painter: _DonutChartPainter(
                    values: values,
                    colors: colors,
                    strokeWidth: 12,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_pendingCount',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
                        ),
                        const Text(
                          'Pending',
                          style: TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Status Summary Grid
              Expanded(
                child: Column(
                  children: [
                    _buildStatusPillRow('Pending', _pendingCount, Colors.orange),
                    const SizedBox(height: 4),
                    _buildStatusPillRow('Confirmed', _confirmedCount, Colors.blue),
                    const SizedBox(height: 4),
                    _buildStatusPillRow('Out for Delivery', _outForDeliveryCount, Colors.purple),
                    const SizedBox(height: 4),
                    _buildStatusPillRow('Delivered', _deliveredCount, Colors.green),
                    const SizedBox(height: 4),
                    _buildStatusPillRow('Cancelled', _cancelledCount, Colors.red),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Multi-Segment Progress Bar
          _SegmentedProgressBar(values: values, colors: colors, height: 8),
        ],
      ),
    );
  }

  Widget _buildStatusPillRow(String label, int count, Color color) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$count',
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ),
      ],
    );
  }

  Widget _buildStockOverviewCard() {
    final total = _allProducts.length;
    final values = [
      _inStockCount.toDouble(),
      _lowStockCount.toDouble(),
      _outOfStockCount.toDouble(),
    ];
    final colors = [
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    final availablePercentage = total > 0 ? ((_inStockCount / total) * 100).round() : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.pie_chart_rounded, color: Colors.green, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stock & Catalog Health',
                            style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Total $total catalog products tracked',
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary, fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (widget.onNavigateTab != null) widget.onNavigateTab!(2);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Manage', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Donut Chart & Side Cards
          Row(
            children: [
              // Donut Chart Widget
              SizedBox(
                width: 80,
                height: 80,
                child: CustomPaint(
                  painter: _DonutChartPainter(
                    values: values,
                    colors: colors,
                    strokeWidth: 12,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$availablePercentage%',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
                        ),
                        const Text(
                          'In Stock',
                          style: TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Stock Status Cards
              Expanded(
                child: Column(
                  children: [
                    _buildStockStatusTile('Available Stock', '$_inStockCount items', Colors.green, const Color(0xFFF0FDF4)),
                    const SizedBox(height: 6),
                    _buildStockStatusTile('Low Stock Alert', '$_lowStockCount items (≤10)', Colors.orange, const Color(0xFFFFF7ED)),
                    const SizedBox(height: 6),
                    _buildStockStatusTile('Out of Stock', '$_outOfStockCount items (0 qty)', Colors.red, const Color(0xFFFEF2F2)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Segmented Bar
          _SegmentedProgressBar(values: values, colors: colors, height: 8),
        ],
      ),
    );
  }

  Widget _buildStockStatusTile(String label, String value, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.inventory_2_outlined, size: 13, color: color),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrdersHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Orders',
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Active orders placed within the last 7 days (< 7 days, not delivered)',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            if (widget.onNavigateTab != null) widget.onNavigateTab!(1);
          },
          child: const Text('View All', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildRecentOrdersList() {
    if (_recentActiveOrders.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: const Column(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 36),
            SizedBox(height: 8),
            Text(
              'No active orders from the past week!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              'All recent orders have been delivered.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _recentActiveOrders.length,
      separatorBuilder: (context, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final order = _recentActiveOrders[index];
        return _buildRecentOrderTile(order);
      },
    );
  }

  Widget _buildRecentOrderTile(AdminOrderModel order) {
    return InkWell(
      onTap: () {
        if (widget.onNavigateTab != null) widget.onNavigateTab!(1);
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFEEEEEE)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: order.statusColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.receipt_long, color: order.statusColor, size: 20),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order #${order.orderId}',
                        style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs. ${order.totalAmount.toStringAsFixed(0)}',
                        style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${order.customerName} • ${order.city ?? 'N/A'}',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 11),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: order.statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          order.statusLabel,
                          style: TextStyle(color: order.statusColor, fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Donut Chart Custom Painter with StrokeCap.butt for clean flat arc edges
class _DonutChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double strokeWidth;

  _DonutChartPainter({
    required this.values,
    required this.colors,
    this.strokeWidth = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final total = values.fold(0.0, (sum, v) => sum + v);
    if (total == 0) {
      final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.width - strokeWidth) / 2,
      );
      final paint = Paint()
        ..color = Colors.grey.shade200
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawArc(rect, 0, 2 * math.pi, false, paint);
      return;
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    double startAngle = -math.pi / 2; // Start from top
    const sweepGap = 0.08;

    for (int i = 0; i < values.length; i++) {
      if (values[i] <= 0) continue;
      final sweepAngle = (values[i] / total) * 2 * math.pi - sweepGap;
      if (sweepAngle <= 0) continue;

      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt; // Flat clean edges without rounded overlap

      canvas.drawArc(rect, startAngle + (sweepGap / 2), sweepAngle, false, paint);
      startAngle += (values[i] / total) * 2 * math.pi;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) => true;
}

// Multi-Segment Progress Bar Widget
class _SegmentedProgressBar extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;
  final double height;

  const _SegmentedProgressBar({
    required this.values,
    required this.colors,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final total = values.fold(0.0, (sum, v) => sum + v);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: total == 0
            ? const SizedBox.shrink()
            : Row(
                children: List.generate(values.length, (i) {
                  final flex = (values[i] * 1000).toInt();
                  if (flex <= 0) return const SizedBox.shrink();
                  return Expanded(
                    flex: flex,
                    child: Container(color: colors[i]),
                  );
                }),
              ),
      ),
    );
  }
}
