import 'package:flutter/material.dart';
import 'pirate_theme.dart';

/// Custom pixel art icons for pirate theme
class PixelIcons {
  // Ship icon (for progress/journey)
  static Widget ship({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ShipPainter(color: color),
    );
  }
  
  // Treasure chest icon (for achievements/rewards)
  static Widget treasureChest({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TreasureChestPainter(color: color),
    );
  }
  
  // Parrot icon (for community/Hank)
  static Widget parrot({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ParrotPainter(color: color),
    );
  }

  // Map icon (for navigation)
  static Widget map({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _MapPainter(color: color),
    );
  }

  // Coin icon (for finance)
  static Widget coin({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CoinPainter(color: color),
    );
  }

  // Checkmark for completed items
  static Widget pixelCheck({double size = 24, Color? color}) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CheckmarkPainter(color: color),
    );
  }
}

class _ShipPainter extends CustomPainter {
  final Color? color;
  
  _ShipPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Draw ship hull
    final hull = Path();
    hull.moveTo(size.width * 0.1, size.height * 0.6);
    hull.lineTo(size.width * 0.3, size.height * 0.8);
    hull.lineTo(size.width * 0.7, size.height * 0.8);
    hull.lineTo(size.width * 0.9, size.height * 0.6);
    hull.close();

    canvas.drawPath(hull, paint);
    
    // Ship mast
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.8),
      Offset(size.width * 0.5, size.height * 0.2),
      paint,
    );
    
    // Sail (triangle)
    final sail = Path();
    sail.moveTo(size.width * 0.5, size.height * 0.2);
    sail.lineTo(size.width * 0.7, size.height * 0.5);
    sail.lineTo(size.width * 0.5, size.height * 0.5);
    sail.close();
    
    canvas.drawPath(sail, paint);
    
    // Flag on top
    final flag = Path();
    flag.moveTo(size.width * 0.5, size.height * 0.2);
    flag.lineTo(size.width * 0.65, size.height * 0.15);
    flag.lineTo(size.width * 0.5, size.height * 0.1);
    flag.close();
    
    canvas.drawPath(flag, paint);
    
    // Ocean waves (just a squiggly line)
    final waves = Path();
    waves.moveTo(0, size.height * 0.9);
    waves.quadraticBezierTo(
      size.width * 0.25, size.height * 0.85, 
      size.width * 0.5, size.height * 0.9
    );
    waves.quadraticBezierTo(
      size.width * 0.75, size.height * 0.95, 
      size.width, size.height * 0.9
    );
    
    final wavePaint = Paint()
      ..color = color ?? PirateTheme.oceanBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    canvas.drawPath(waves, wavePaint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _TreasureChestPainter extends CustomPainter {
  final Color? color;
  
  _TreasureChestPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Chest body
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.4, size.width * 0.6, size.height * 0.4),
      paint,
    );
    
    // Chest lid (curved top)
    final lid = Path();
    lid.moveTo(size.width * 0.2, size.height * 0.4);
    lid.lineTo(size.width * 0.2, size.height * 0.3);
    lid.quadraticBezierTo(
      size.width * 0.5, size.height * 0.2,
      size.width * 0.8, size.height * 0.3
    );
    lid.lineTo(size.width * 0.8, size.height * 0.4);
    
    canvas.drawPath(lid, paint);
    
    // Lock
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.45, size.height * 0.35, size.width * 0.1, size.height * 0.1),
      paint,
    );
    
    // Some gold coins spilling out (small circles)
    final coinPaint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.45),
      size.width * 0.05,
      coinPaint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.5),
      size.width * 0.04,
      coinPaint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.6),
      size.width * 0.045,
      coinPaint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ParrotPainter extends CustomPainter {
  final Color? color;
  
  _ParrotPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final bodyPaint = Paint()
      ..color = PirateTheme.parrotGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final headPaint = Paint()
      ..color = PirateTheme.parrotRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Parrot body (oval shape)
    final body = Path();
    body.addOval(
      Rect.fromLTWH(size.width * 0.3, size.height * 0.4, size.width * 0.4, size.height * 0.4),
    );
    canvas.drawPath(body, bodyPaint);
    
    // Parrot head
    final head = Path();
    head.addOval(
      Rect.fromLTWH(size.width * 0.5, size.height * 0.2, size.width * 0.3, size.height * 0.3),
    );
    canvas.drawPath(head, headPaint);
    
    // Eye
    final eyePaint = Paint()
      ..color = color ?? PirateTheme.blackInk
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.3),
      size.width * 0.03,
      eyePaint,
    );
    
    // Beak
    final beakPaint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final beak = Path();
    beak.moveTo(size.width * 0.8, size.height * 0.35);
    beak.lineTo(size.width * 0.95, size.height * 0.4);
    beak.lineTo(size.width * 0.8, size.height * 0.45);
    
    canvas.drawPath(beak, beakPaint);
    
    // Wing
    final wing = Path();
    wing.moveTo(size.width * 0.3, size.height * 0.5);
    wing.lineTo(size.width * 0.2, size.height * 0.7);
    wing.lineTo(size.width * 0.3, size.height * 0.7);
    wing.close();
    
    canvas.drawPath(wing, bodyPaint);
    
    // Feet
    canvas.drawLine(
      Offset(size.width * 0.4, size.height * 0.8),
      Offset(size.width * 0.4, size.height * 0.9),
      bodyPaint,
    );
    
    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.8),
      Offset(size.width * 0.6, size.height * 0.9),
      bodyPaint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _MapPainter extends CustomPainter {
  final Color? color;
  
  _MapPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? PirateTheme.sandBeige
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Map outline (slightly uneven rectangle for old look)
    final map = Path();
    map.moveTo(size.width * 0.1, size.height * 0.2);
    map.lineTo(size.width * 0.9, size.height * 0.15);
    map.lineTo(size.width * 0.85, size.height * 0.85);
    map.lineTo(size.width * 0.15, size.height * 0.8);
    map.close();
    
    canvas.drawPath(map, paint);
    
    // Dotted line for route
    final routePaint = Paint()
      ..color = color ?? PirateTheme.darkBrown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final dashWidth = size.width * 0.05;
    final dashSpace = size.width * 0.03;
    double startX = size.width * 0.2;
    final startY = size.height * 0.4;
    final endX = size.width * 0.8;
    final endY = size.height * 0.6;
    
    // Draw dotted line
    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, startY + (startX - size.width * 0.2) * 0.5),
        Offset(startX + dashWidth, 
               startY + (startX + dashWidth - size.width * 0.2) * 0.5),
        routePaint,
      );
      startX += dashWidth + dashSpace;
    }
    
    // X marks the spot
    final xPaint = Paint()
      ..color = color ?? PirateTheme.parrotRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    
    canvas.drawLine(
      Offset(size.width * 0.75, size.height * 0.55),
      Offset(size.width * 0.85, size.height * 0.65),
      xPaint,
    );
    
    canvas.drawLine(
      Offset(size.width * 0.75, size.height * 0.65),
      Offset(size.width * 0.85, size.height * 0.55),
      xPaint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CoinPainter extends CustomPainter {
  final Color? color;
  
  _CoinPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.fill;
    
    // Coin shape (circle)
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.4,
      paint,
    );
    
    // Coin border
    final borderPaint = Paint()
      ..color = color != null ? color!.withOpacity(0.7) : PirateTheme.darkBrown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.4,
      borderPaint,
    );
    
    // Dollar sign
    final symbolPaint = Paint()
      ..color = color != null ? color!.withOpacity(0.7) : PirateTheme.darkBrown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    
    // Vertical line
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.3),
      Offset(size.width * 0.5, size.height * 0.7),
      symbolPaint,
    );
    
    // Top horizontal line
    canvas.drawLine(
      Offset(size.width * 0.4, size.height * 0.4),
      Offset(size.width * 0.6, size.height * 0.4),
      symbolPaint,
    );
    
    // Bottom horizontal line
    canvas.drawLine(
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.6),
      symbolPaint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CheckmarkPainter extends CustomPainter {
  final Color? color;
  
  _CheckmarkPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? PirateTheme.goldYellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15;
    
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.7);
    path.lineTo(size.width * 0.8, size.height * 0.3);
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}