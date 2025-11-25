import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacez Coupons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB35A2A),
        scaffoldBackgroundColor: const Color(0xFFF6F4F1),
        useMaterial3: false,
      ),
      home: const CouponsPage(),
    );
  }
}

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final brown = const Color(0xFFB35A2A);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          color: Colors.black87,
          onPressed: () => _showMessage('Back pressed'),
        ),
        title: const Text(
          'Coupons',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      bottomSheet: GestureDetector(
        onTap: () => _showMessage('Exclusive rewards banner clicked'),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, -2),
                color: Colors.black12,
              ),
            ],
          ),
          child: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Book now & Unlock exclusive rewards!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, -2),
              color: Colors.black12,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          '₹19,500',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '₹16,000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'for 2 nights',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      '24 Apr - 26 Apr | 8 guests',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                  ),
                  onPressed: () => _showMessage('Reserve button clicked'),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
        child: ListView(
          children: [
            CouponCard(
              priceLabel: '₹6,900',
              title: 'LONGSTAY',
              description:
                  '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
              onApply: () =>
                  _showMessage('LONGSTAY coupon applied successfully'),
              onReadMore: () => _showMessage('LONGSTAY details coming soon'),
            ),
            CouponCard(
              priceLabel: '₹6,900',
              title: 'LONGSTAY',
              description:
                  '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
              onApply: () =>
                  _showMessage('Second LONGSTAY coupon applied'),
              onReadMore: () =>
                  _showMessage('More info for this coupon coming soon'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Payment offers:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            CouponCard(
              priceLabel: '₹6,900',
              title: 'LONGSTAY',
              description:
                  '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
              onApply: () =>
                  _showMessage('Payment offer applied successfully'),
              onReadMore: () =>
                  _showMessage('Payment offer details coming soon'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String priceLabel;
  final String title;
  final String description;
  final VoidCallback onApply;
  final VoidCallback onReadMore;

  const CouponCard({
    super.key,
    required this.priceLabel,
    required this.title,
    required this.description,
    required this.onApply,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    final brown = const Color(0xFFB35A2A);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onApply,
        child: Row(
          children: [
            Container(
              width: 56,
              height: 130,
              decoration: BoxDecoration(
                color: brown,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    priceLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: onApply,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.local_offer_outlined,
                                  size: 16, color: brown),
                              const SizedBox(width: 4),
                              Text(
                                'Apply',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: brown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: onReadMore,
                      child: const Text(
                        'Read more',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
