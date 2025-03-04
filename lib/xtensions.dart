import 'dart:ui';

import 'package:flutter/material.dart';

/// Blur extension for Widget.
///
/// This extension allows you to apply a blur effect to any widget.
///
/// Use the extension as follows:
/// ```dart
/// Widget blurredWidget = myWidget.blur(sigmaX: 5, sigmaY: 5, borderRadius: BorderRadius.circular(10));
/// ```
///
/// The [sigmaX] and [sigmaY] parameters define the blur radius for the x and y axes.
/// The [borderRadius] parameter allows you to specify the border radius for the widget.
///
/// Returns a new widget with the blur effect applied.
extension Blur on Widget {
  Widget blur({double? sigmaX, double? sigmaY, BorderRadius? borderRadius}) =>
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX ?? 10, sigmaY: sigmaY ?? 10),
          child: this,
        ),
      );
}

/// Extension for applying opacity to a Widget.
///
/// This extension allows you to set the opacity of any widget.
///
/// Use the extension as follows:
/// ```dart
/// Widget opaqueWidget = myWidget.withOpacity(0.5);
/// ```
///
/// The [opacity] parameter defines the opacity level (0.0 to 1.0).
///
/// Returns a new widget with the specified opacity applied.
extension WithOpacity on Widget {
  Widget withOpacity(double opacity) => Opacity(opacity: opacity, child: this);
}

/// Tailwind Column extension for Column widget.
///
/// This extension allows you to apply Tailwind CSS-like styling to a Column widget.
///
/// Use the extension as follows:
/// ```dart
/// Column myColumn = Column().tailwind("min main-start cross-center");
/// ```
///
/// The [style] parameter is a string of Tailwind classes.
///
/// Returns a new Column widget styled according to the provided classes.
extension TailwindColumn on Column {
  Column tailwind(String style) {
    final Set<String> styleSet =
        style.split(" ").toSet(); // Convert string to set

    return Column(
      mainAxisSize: _parseSize(styleSet),
      mainAxisAlignment: _parseMain(styleSet),
      crossAxisAlignment: _parseCross(styleSet),
      children: children, // Preserve original children
    );
  }

  // Default to MainAxisSize.max if neither "max" nor "min" is specified
  MainAxisSize _parseSize(Set<String> styleSet) {
    if (styleSet.contains("min")) return MainAxisSize.min;
    return MainAxisSize.max; // Default
  }

  // Parse main axis alignment
  MainAxisAlignment _parseMain(Set<String> styleSet) {
    const mainMap = {
      "main-start": MainAxisAlignment.start,
      "main-center": MainAxisAlignment.center,
      "main-end": MainAxisAlignment.end,
      "main-sb": MainAxisAlignment.spaceBetween,
      "main-sa": MainAxisAlignment.spaceAround,
      "main-se": MainAxisAlignment.spaceEvenly,
    };

    for (var key in mainMap.keys) {
      if (styleSet.contains(key)) return mainMap[key]!;
    }

    return MainAxisAlignment.start; // Default
  }

  // Parse cross axis alignment
  CrossAxisAlignment _parseCross(Set<String> styleSet) {
    const crossMap = {
      "cross-start": CrossAxisAlignment.start,
      "cross-center": CrossAxisAlignment.center,
      "cross-end": CrossAxisAlignment.end,
      "cross-stretch": CrossAxisAlignment.stretch,
      "cross-baseline": CrossAxisAlignment.baseline,
    };

    for (var key in crossMap.keys) {
      if (styleSet.contains(key)) return crossMap[key]!;
    }

    return CrossAxisAlignment.start; // Default
  }
}

/// Tailwind Row extension for Row widget.
///
/// This extension allows you to apply Tailwind CSS-like styling to a Row widget.
///
/// Use the extension as follows:
/// ```dart
/// Row myRow = Row().tailwind("min main-start cross-center");
/// ```
///
/// The [style] parameter is a string of Tailwind classes.
///
/// Returns a new Row widget styled according to the provided classes.
extension TailwindRow on Row {
  Row tailwind(String style) {
    final Set<String> styleSet =
        style.split(" ").toSet(); // Convert string to set

    return Row(
      mainAxisSize: _parseSize(styleSet),
      mainAxisAlignment: _parseMain(styleSet),
      crossAxisAlignment: _parseCross(styleSet),
      children: children, // Preserve original children
    );
  }

  // Default to MainAxisSize.max if neither "max" nor "min" is specified
  MainAxisSize _parseSize(Set<String> styleSet) {
    if (styleSet.contains("min")) return MainAxisSize.min;
    return MainAxisSize.max; // Default
  }

  // Parse main axis alignment
  MainAxisAlignment _parseMain(Set<String> styleSet) {
    const mainMap = {
      "main-start": MainAxisAlignment.start,
      "main-center": MainAxisAlignment.center,
      "main-end": MainAxisAlignment.end,
      "main-sb": MainAxisAlignment.spaceBetween,
      "main-sa": MainAxisAlignment.spaceAround,
      "main-se": MainAxisAlignment.spaceEvenly,
    };

    for (var key in mainMap.keys) {
      if (styleSet.contains(key)) return mainMap[key]!;
    }

    return MainAxisAlignment.start; // Default
  }

  // Parse cross axis alignment
  CrossAxisAlignment _parseCross(Set<String> styleSet) {
    const crossMap = {
      "cross-start": CrossAxisAlignment.start,
      "cross-center": CrossAxisAlignment.center,
      "cross-end": CrossAxisAlignment.end,
      "cross-stretch": CrossAxisAlignment.stretch,
      "cross-baseline": CrossAxisAlignment.baseline,
    };

    for (var key in crossMap.keys) {
      if (styleSet.contains(key)) return crossMap[key]!;
    }

    return CrossAxisAlignment.start; // Default
  }
}

/// Tailwind Container extension for Container widget.
///
/// This extension allows you to apply Tailwind CSS-like styling to a Container widget.
///
/// Use the extension as follows:
/// ```dart
/// Container myContainer = Container().tailwind("w-full h-1/2 bg-red-500 rounded-md", context);
/// ```
///
/// The [style] parameter is a string containing Tailwind CSS classes for width, height,
/// background color, and border radius. The [context] parameter is used to access
/// MediaQuery for responsive sizing.
///
/// Returns a new Container widget styled according to the provided classes.
extension TailwindContainer on Container {
  Container tailwind(String style, BuildContext context) {
    final Set<String> styleSet = style.split(" ").toSet();

    return Container(
      width: _parseWidth(styleSet, context),
      height: _parseHeight(styleSet, context),
      decoration: BoxDecoration(
        color: _parseColor(styleSet, context),
        borderRadius: _parseBorderRadius(styleSet),
      ),
      child: child,
    );
  }

  double _parseWidth(Set<String> styleSet, BuildContext context) {
    for (var key in styleSet) {
      if (key.startsWith("w-")) {
        String widthValue = key.substring(2);
        switch (widthValue) {
          case "full":
            return double.infinity;
          case "1/2":
            return MediaQuery.of(context).size.width / 2;
          case "1/3":
            return MediaQuery.of(context).size.width / 3;
          case "1/4":
            return MediaQuery.of(context).size.width / 4;
          case "1/5":
            return MediaQuery.of(context).size.width / 5;
          // Add more cases as needed for other width classes
        }
      }
    }
    return 0;
  }

  double _parseHeight(Set<String> styleSet, BuildContext context) {
    for (var key in styleSet) {
      if (key.startsWith("h-")) {
        String heightValue = key.substring(2);
        switch (heightValue) {
          case "full":
            return double.infinity;
          case "1/2":
            return MediaQuery.of(context).size.height / 2;
          case "1/3":
            return MediaQuery.of(context).size.height / 3;
          case "1/4":
            return MediaQuery.of(context).size.height / 4;
          case "1/5":
            return MediaQuery.of(context).size.height / 5;
          // Add more cases as needed for other height classes
        }
      }
    }
    return 0;
  }

  Color _parseColor(Set<String> styleSet, BuildContext context) {
    for (var key in styleSet) {
      if (key.startsWith("bg-")) {
        String colorValue = key.substring(3);
        List<String> parts = colorValue.split('-');
        if (parts.length == 2 && parts[1].isNotEmpty) {
          String colorName = parts[0];
          String shade = parts[1];
          return _getColorByShade(colorName, shade, context);
        }
      }
    }
    return throw Exception("Invalid color class: $styleSet");
  }

  Color _getColorByShade(String colorName, String shade, BuildContext context) {
    switch (colorName) {
      case "red":
        return _getRedShade(shade);
      case "blue":
        return _getBlueShade(shade);
      case "green":
        return _getGreenShade(shade);
      case "yellow":
        return _getYellowShade(shade);
      case "purple":
        return _getPurpleShade(shade);
      case "pink":
        return _getPinkShade(shade);
      case "gray":
        return _getGrayShade(shade);
      case "black":
        return Colors.black;
      case "white":
        return Colors.white;
      case "primary":
        return Theme.of(context).colorScheme.primary;
      case "secondary":
        return Theme.of(context).colorScheme.secondary;
      case "tertiary":
        return Theme.of(context).colorScheme.tertiary;
      case "surface":
        return Theme.of(context).colorScheme.surface;
      case "onSurface":
        return Theme.of(context).colorScheme.onSurface;
      case "onPrimary":
        return Theme.of(context).colorScheme.onPrimary;
      case "onSecondary":
        return Theme.of(context).colorScheme.onSecondary;
      case "onTertiary":
        return Theme.of(context).colorScheme.onTertiary;
      case "onError":
        return Theme.of(context).colorScheme.onError;
      case "transparent":
        return Colors.transparent;
      // Add more cases as needed for other color classes
      default:
        return throw Exception("Invalid color class: $colorName");
    }
  }

  Color _getRedShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.red[100]!;
      case "200":
        return Colors.red[200]!;
      case "300":
        return Colors.red[300]!;
      case "400":
        return Colors.red[400]!;
      case "500":
        return Colors.red[500]!;
      case "600":
        return Colors.red[600]!;
      case "700":
        return Colors.red[700]!;
      case "800":
        return Colors.red[800]!;
      case "900":
        return Colors.red[900]!;
      default:
        return Colors.red; // Fallback
    }
  }

  Color _getBlueShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.blue[100]!;
      case "200":
        return Colors.blue[200]!;
      case "300":
        return Colors.blue[300]!;
      case "400":
        return Colors.blue[400]!;
      case "500":
        return Colors.blue[500]!;
      case "600":
        return Colors.blue[600]!;
      case "700":
        return Colors.blue[700]!;
      case "800":
        return Colors.blue[800]!;
      case "900":
        return Colors.blue[900]!;
      default:
        return Colors.blue; // Fallback
    }
  }

  Color _getGreenShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.green[100]!;
      case "200":
        return Colors.green[200]!;
      case "300":
        return Colors.green[300]!;
      case "400":
        return Colors.green[400]!;
      case "500":
        return Colors.green[500]!;
      case "600":
        return Colors.green[600]!;
      case "700":
        return Colors.green[700]!;
      case "800":
        return Colors.green[800]!;
      case "900":
        return Colors.green[900]!;
      default:
        return Colors.green; // Fallback
    }
  }

  Color _getYellowShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.yellow[100]!;
      case "200":
        return Colors.yellow[200]!;
      case "300":
        return Colors.yellow[300]!;
      case "400":
        return Colors.yellow[400]!;
      case "500":
        return Colors.yellow[500]!;
      case "600":
        return Colors.yellow[600]!;
      case "700":
        return Colors.yellow[700]!;
      case "800":
        return Colors.yellow[800]!;
      case "900":
        return Colors.yellow[900]!;
      default:
        return Colors.yellow; // Fallback
    }
  }

  Color _getPurpleShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.purple[100]!;
      case "200":
        return Colors.purple[200]!;
      case "300":
        return Colors.purple[300]!;
      case "400":
        return Colors.purple[400]!;
      case "500":
        return Colors.purple[500]!;
      case "600":
        return Colors.purple[600]!;
      case "700":
        return Colors.purple[700]!;
      case "800":
        return Colors.purple[800]!;
      case "900":
        return Colors.purple[900]!;
      default:
        return Colors.purple; // Fallback
    }
  }

  Color _getPinkShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.pink[100]!;
      case "200":
        return Colors.pink[200]!;
      case "300":
        return Colors.pink[300]!;
      case "400":
        return Colors.pink[400]!;
      case "500":
        return Colors.pink[500]!;
      case "600":
        return Colors.pink[600]!;
      case "700":
        return Colors.pink[700]!;
      case "800":
        return Colors.pink[800]!;
      case "900":
        return Colors.pink[900]!;
      default:
        return Colors.pink; // Fallback
    }
  }

  Color _getGrayShade(String shade) {
    switch (shade) {
      case "100":
        return Colors.grey[100]!;
      case "200":
        return Colors.grey[200]!;
      case "300":
        return Colors.grey[300]!;
      case "400":
        return Colors.grey[400]!;
      case "500":
        return Colors.grey[500]!;
      case "600":
        return Colors.grey[600]!;
      case "700":
        return Colors.grey[700]!;
      case "800":
        return Colors.grey[800]!;
      case "900":
        return Colors.grey[900]!;
      default:
        return Colors.grey; // Fallback
    }
  }

  BorderRadius _parseBorderRadius(Set<String> styleSet) {
    double topLeft = 0, topRight = 0, bottomLeft = 0, bottomRight = 0;

    for (var key in styleSet) {
      if (key.startsWith("rounded-")) {
        String radiusValue = key.substring(7);
        if (radiusValue.contains("-")) {
          // Handle specific corners
          var corners = radiusValue.split("-");
          if (corners[0] == "tl") topLeft = _getCornerRadius(corners[1]);
          if (corners[0] == "tr") topRight = _getCornerRadius(corners[1]);
          if (corners[0] == "bl") bottomLeft = _getCornerRadius(corners[1]);
          if (corners[0] == "br") bottomRight = _getCornerRadius(corners[1]);
        } else {
          // Handle general rounded cases
          return _getBorderRadius(radiusValue);
        }
      }
    }
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    ); // Return combined border radius
  }

  double _getCornerRadius(String radiusValue) {
    switch (radiusValue) {
      case "full":
        return double.infinity;
      case "none":
        return 0;
      case "sm":
        return 8;
      case "md":
        return 16;
      case "lg":
        return 24;
      case "xl":
        return 32;
      case "2xl":
        return 48;
      case "3xl":
        return 64;
      case "4xl":
        return 80;
      case "5xl":
        return 100;
      case "6xl":
        return 120;
      case "7xl":
        return 140;
      case "8xl":
        return 160;
      case "9xl":
        return 180;
      case "10xl":
        return 200;
      default:
        return 0; // Fallback for unrecognized values
    }
  }

  BorderRadius _getBorderRadius(String radiusValue) {
    switch (radiusValue) {
      case "full":
        return BorderRadius.circular(double.infinity);
      case "none":
        return BorderRadius.zero;
      case "sm":
        return BorderRadius.circular(8);
      case "md":
        return BorderRadius.circular(16);
      case "lg":
        return BorderRadius.circular(24);
      case "xl":
        return BorderRadius.circular(32);
      case "2xl":
        return BorderRadius.circular(48);
      case "3xl":
        return BorderRadius.circular(64);
      case "4xl":
        return BorderRadius.circular(80);
      case "5xl":
        return BorderRadius.circular(100);
      case "6xl":
        return BorderRadius.circular(120);
      case "7xl":
        return BorderRadius.circular(140);
      case "8xl":
        return BorderRadius.circular(160);
      case "9xl":
        return BorderRadius.circular(180);
      case "10xl":
        return BorderRadius.circular(200);
      default:
        return BorderRadius.zero; // Fallback for unrecognized values
    }
  }
}

/// SizedBox Wrapper extension for Widget.
///
/// This extension wraps a widget in a SizedBox with the specified width and height.
///
/// Use the extension as follows:
/// ```dart
/// Widget sizedWidget = myWidget.sized(w: 100, h: 200);
/// ```
///
/// The [w] parameter defines the width of the SizedBox.
/// The [h] parameter defines the height of the SizedBox.
///
/// Returns a new SizedBox widget wrapping the original widget.
extension SizedBoxWrapper on Widget {
  Widget sized({double? w, double? h}) =>
      SizedBox(width: w, height: h, child: this);
}

/// Scrolls extension for Widget.
///
/// This extension wraps a widget in a SingleChildScrollView with optional scroll physics.
///
/// Use the extension as follows:
/// ```dart
/// Widget scrollableWidget = myWidget.scrolls(physics: BouncingScrollPhysics());
/// ```
///
/// The [physics] parameter defines the scroll physics, defaulting to AlwaysScrollableScrollPhysics.
///
/// Returns a new SingleChildScrollView widget wrapping the original widget.
extension Scrolls on Widget {
  Widget scrolls({ScrollPhysics? physics}) => SingleChildScrollView(
    physics: physics ?? AlwaysScrollableScrollPhysics(),
    child: this,
  );
}
