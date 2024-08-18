import 'package:flutter/widgets.dart';

/// custom text class
class BentoTextStyles {
  static const TextStyle captionDF = TextStyle(fontSize: 14, height: 1.25, letterSpacing: 0.0);
  static const TextStyle bodyDF = TextStyle(fontSize: 16, height: 1.5, letterSpacing: 0.0);
  static const TextStyle subtitle = TextStyle(fontSize: 17, height: 1.25, letterSpacing: 0.25);
  static const TextStyle title = TextStyle(fontSize: 24, height: 1.25, letterSpacing: 0.0);
}

class BentoTextCaptionDF extends BentoText {
  const BentoTextCaptionDF(
    String data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.selectionColor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(data, BentoTextStyles.captionDF);
}

class BentoTextBodyDF extends BentoText {
  const BentoTextBodyDF(
    String data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.selectionColor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(data, BentoTextStyles.bodyDF);
}

class BentoTextSubtitle extends BentoText {
  const BentoTextSubtitle(
    String data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.selectionColor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(data, BentoTextStyles.subtitle);
}

class BentoTextTitle extends BentoText {
  const BentoTextTitle(
    String data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.selectionColor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(data, BentoTextStyles.title);
}

class BentoText extends StatelessWidget {
  const BentoText(
    this.data,
    this.defaultStyle, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.selectionColor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  final String data;
  final TextStyle defaultStyle;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final Color? selectionColor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: defaultStyle.merge(style),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      selectionColor: selectionColor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
