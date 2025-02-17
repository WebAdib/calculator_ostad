import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final String btnText;
  final Color? btnColor;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    required this.btnText,
    this.btnColor,
    required this.onTap,
  }) : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 80), // Fast smooth animation
      lowerBound: 0.95, // Slight press-in effect
      upperBound: 1.0,
    );
    _controller.addListener(() {
      setState(() {
        _scale = _controller.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse(); // Shrink effect when pressed
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward(); // Return to normal size
    widget.onTap(); // Execute button function
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth1 = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.forward(), // Reset if canceled
      child: Transform.scale(
        scale: _scale,
        child: Container(
          margin: EdgeInsets.all(8),
          height: screenWidth1 * 0.17,
          width: screenWidth1 * 0.17,
          decoration: BoxDecoration(
            color: widget.btnColor ?? Colors.grey[800],
            shape: BoxShape.circle,
          ),
          child: Material(
            color: Colors.transparent,
            shape: CircleBorder(),
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.white.withOpacity(0.2), // Softer ripple
              highlightColor:
                  widget.btnColor?.withOpacity(0.3), // Blends with button color
              child: Center(
                child: Text(
                  widget.btnText,
                  style: TextStyle(
                    fontSize: screenWidth1 * 0.08,
                    color: Colors.white,
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
