import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';
import '../../../brand/presentation/bloc/brand_event.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_event.dart';
import '../../../product_type/presentation/bloc/product_type_bloc.dart';
import '../../../product_type/presentation/bloc/product_type_event.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_event.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../../../order/presentation/bloc/order_event.dart';
import '../widgets/app_drawer.dart';
import 'dashboard_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../wishlist/presentation/pages/wishlist_page.dart';
import '../../../shop/presentation/pages/shop_page.dart';
import '../../../chatbot/presentation/pages/chat_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<CartBloc>().add(GetCartEvent(authState.user.userId));
      
      // Refresh essential dashboard data if they are in error state or empty
      context.read<ProductTypeBloc>().add(GetAllProductTypesEvent());
      context.read<CategoryBloc>().add(GetAllCategoriesEvent());
      context.read<BrandBloc>().add(GetAllBrandsEvent());
      context.read<ProductBloc>().add(GetAllProductsEvent());
      context.read<OrderBloc>().add(FetchOrdersEvent(authState.user.userId));
    }
  }

  final List<Widget> _pages = [
    const DashboardPage(),
    const ShopPage(),
    // const Scaffold(body: Center(child: Text('Order'))),
    const WishlistPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
      drawer: AppDrawer(
        onNavigate: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      extendBody: true,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        height: 60 + bottomPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(0, Icons.grid_view_rounded),
            _buildNavItem(1, Icons.shopping_bag_rounded),
            // _buildNavItem(2, Icons.receipt_long_rounded),
            _buildNavItem(2, Icons.favorite_rounded),
            _buildNavItem(3, Icons.person_rounded),
          ],
        ),
      ),
    ));
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 40,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Lifting Effect using Translation
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                transform: Matrix4.translationValues(0, isSelected ? -10 : 0, 0),
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? AppColors.primary : Colors.black26,
                ),
              ),
              // Dot Indicator
              Positioned(
                bottom: 12,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 5,
                  width: isSelected ? 5 : 0,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
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
