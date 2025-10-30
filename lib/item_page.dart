import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeeshop/menu_item.dart';
import 'package:coffeeshop/state/cart.dart';
import 'package:coffeeshop/cart_page.dart';

class ItemPage extends StatefulWidget {
  const ItemPage(this.item, {super.key});
  final MenuItem item;
  @override
  State<ItemPage> createState() {
    return _ItemPageState();
  }
}

class _ItemPageState extends State<ItemPage> {
  String _size = 'M';
  int _qty = 1;
  bool _milkChocolate = true;
  bool _whiteChocolate = false;
  bool _darkChocolate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.item.imagePath,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.item.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      widget.item.rating,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 12),
                
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Description',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 6),
                Text('something about coffeee here... more',
                  style: GoogleFonts.inter(color: Colors.black87),
                ),
                SizedBox(height: 16),
                Text(
                  'Choice of Chocolate',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _choice(
                      'Milk Chocolate',
                      _milkChocolate,
                      (v) => setState(() => _milkChocolate = v),
                    ),
                    _choice(
                      'White Chocolate',
                      _whiteChocolate,
                      (v) => setState(() => _whiteChocolate = v),
                    ),
                    _choice(
                      'Dark Chocolate',
                      _darkChocolate,
                      (v) => setState(() => _darkChocolate = v),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Size',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 12),
                    _sizeChip('S'),
                    SizedBox(width: 8),
                    _sizeChip('M'),
                    SizedBox(width: 8),
                    _sizeChip('L'),
                    Spacer(),
                    _qtyControl(),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          _buyBar(),
        ],
      ),
    );
  }

  Widget _choice(String label, bool selected, ValueChanged<bool> onChanged) {
    return FilterChip(
      selected: selected,
      label: Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      onSelected: onChanged,
      selectedColor: Color.fromRGBO(150, 114, 89, 0.15),
      checkmarkColor: Color.fromRGBO(150, 114, 89, 1),
    );
  }

  Widget _sizeChip(String label) {
    final selected = _size == label;
    return GestureDetector(
      onTap: () => setState(() => _size = label),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: selected
              ? Color.fromRGBO(150, 114, 89, 1)
              : const Color.fromARGB(255, 239, 235, 233),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _qtyControl() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => setState(() => _qty = _qty > 1 ? _qty - 1 : 1),
          ),
          Text('$_qty', style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() => _qty += 1),
          ),
        ],
      ),
    );
  }

  Widget _buyBar() {
    final unitPrice = double.tryParse(widget.item.price) ?? 0.0;
    final price = unitPrice * _qty;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: GoogleFonts.inter(color: Colors.black54)),
              Text(
                'US ${price.toStringAsFixed(2)}',
                style: GoogleFonts.inter(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 140,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(150, 114, 89, 1),
              ),
              onPressed: () {
                cart.add(widget.item, qty: _qty, size: _size);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
              child: Text(
                'Buy Now',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
