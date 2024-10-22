import 'package:admin/core/routes/app_router.dart';
import 'package:admin/core/theme/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_extenstion.dart';

class AdminTheme {
  static ThemeData buildTheme({
    Brightness? brightness,
    TargetPlatform defaultTargetPlatform = TargetPlatform.iOS,
    required CustomizasionThemeExt customizasionExt,
    List<ThemeExtension> exenstions = const [],
  }) {

    bool useDark = customizasionExt.themeMode == ThemeMode.dark;
    /* ColorScheme colorScheme = ColorScheme(
      primary: const Color.fromARGB(255, 7, 63, 176), // Soft Blue
      onPrimary: useDark ? Colors.white : Colors.black,
      secondary: useDark
          ? const Color.fromARGB(255, 113, 246, 206)
          : const Color.fromARGB(255, 255, 87, 34), // Vibrant Orange
      onSecondary: Colors.white,
      surface: useDark
          ? const Color.fromARGB(255, 33, 33, 33)
          : const Color.fromARGB(255, 255, 255, 255),
      onSurface: const Color.fromARGB(255, 229, 218, 218),
      primaryContainer: useDark
          ? const Color.fromARGB(255, 48, 47, 47)
          : const Color.fromARGB(255, 222, 222, 222),
      // secondaryContainer: useDark
      //     ? const Color.fromARGB(150, 0, 47, 47)
      //     : const Color.fromARGB(150, 222, 222, 222),    
      error: Colors.redAccent,
      onError: Colors.white,
      brightness: !useDark ? Brightness.light : Brightness.dark,
      shadow: useDark
          ? const Color.fromARGB(255, 105, 104, 104).withOpacity(0.2)
          : Colors.black.withOpacity(0.2),
    );
     */
    // colorScheme = ColorScheme.fromSeed(
    //   seedColor: Color.fromARGB(255, 7, 63, 176),
    //   brightness: !useDark ? Brightness.light : Brightness.dark,
    // );

    ColorScheme colorScheme = ColorScheme(
      brightness: useDark ? Brightness.dark : Brightness.light,

      primary: useDark
          ? const Color(0xFF1976D2) // Bright Blue (dark mode)
          : const Color(0xFF3F51B5), // Vibrant Indigo (light mode)

      onPrimary: useDark
          ? Colors.white
          : const Color.fromARGB(255, 0, 0, 0), // White text on primary for both

      secondary: useDark
          ? const Color(0xFF00ACC1) // Aquamarine Blue (dark mode)
          // : const Color(0xFFFFC107), // Warm Yellow (light mode)
          : const Color.fromARGB(255, 69, 122, 226), // Warm Yellow (light mode)

      onSecondary: useDark
          ? const Color(0xFF212121) // Dark background for contrast in dark mode
          : const Color(0xFFFFFFFF), // White text for light mode

      surface: useDark
          ? const Color(0xFF3F51B5) // Dark background for surface
          : const Color(0xFFFFFFFF), // Light background for surface

      onSurface: useDark
          ? const Color(0xFFEEEEEE) // Light text on dark surfaces
          : const Color(0xFF424242), // Dark text on light surfaces

      primaryContainer: useDark
          ? const Color(0xFF2C3E50) // Muted Blue (dark mode container)
          : const Color(0xFFE3F2FD), // Soft Blue (light mode container)

      onPrimaryContainer: useDark
          ? const Color(
              0xFF90CAF9) // Lighter blue text in container for dark mode
          : const Color(0xFF1E88E5), // Strong blue in container for light mode

      secondaryContainer: useDark
          ? const Color(0xFF37474F) // Dark Blue-Grey (dark mode)
          : const Color(
              0xFFFFF3E0), // Light Orange background for secondary container

      onSecondaryContainer: useDark
          ? const Color(0xFF00BCD4) // Bright Cyan text in dark container
          : const Color(0xFFBF360C), // Dark Orange in light container

      error: Colors.redAccent,
      onError: Colors.white,

      shadow: useDark
          ? const Color(0xFF000000).withOpacity(0.4)
          : const Color(0xFF000000)
              .withOpacity(0.1), // Softer shadow for light mode

      background: useDark
          ? const Color(0xFF121212) // Dark background
          : const Color(0xFFF5F5F5), // Off-white background

      onBackground: useDark
          ? const Color(0xFFEEEEEE) // Light text for dark background
          : const Color(0xFF212121), // Dark text for light background

      surfaceTint: useDark
          ? const Color(0xFF2196F3) // Tinted blue for dark surfaces
          : const Color(0xFFBBDEFB), // Soft blue tint for light surfaces

      inverseSurface: useDark
          ? const Color(0xFFF5F5F5) // Light inverse for dark mode
          : const Color(0xFF212121), // Dark inverse for light mode

      onInverseSurface: useDark
          ? const Color(0xFF212121)
          : const Color(0xFFF5F5F5), // White on dark inverse
    );

    var themeData = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: [customizasionExt, ...exenstions],

      // General settings
      visualDensity: VisualDensity.adaptivePlatformDensity,
      platform: defaultTargetPlatform,

      // Scaffold background and general colors
      // scaffoldBackgroundColor: colorScheme.secondaryContainer,
      scaffoldBackgroundColor: Colors.transparent,
      
      canvasColor: colorScheme.surface,
      dividerColor: Colors.grey.shade400,
      // Font
      fontFamily: 'Poppins',
      typography: Typography.material2021(),
      textTheme: TextThemeProvider.getTextTheme(colorScheme.brightness),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(customizasionExt.radius),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(customizasionExt.radius),
          ),
        ),
      ),

      // Card and Dialog Theme
      cardTheme: CardTheme(
        color: colorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customizasionExt.radius),
        ),
        elevation: 0,
        // shadowColor: colorScheme.shadow.withOpacity(0.8),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 20),

      // Divider Theme
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: colorScheme.onSurface.withOpacity(0.1),
      ),

      // Drawer Theme
      drawerTheme: DrawerThemeData(
        backgroundColor: colorScheme.surface,
      ),

      // Tooltip theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(customizasionExt.radius / 2),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        padding: const EdgeInsets.all(8),
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.secondary,
        contentTextStyle: TextStyle(color: colorScheme.onSecondary),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customizasionExt.radius),
        ),
      ),

      // TabBar theme
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurface.withOpacity(0.6),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),

      // Checkbox and Switch Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customizasionExt.radius / 2),
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor:
            WidgetStateProperty.all(colorScheme.primary.withOpacity(0.5)),
        thumbColor: WidgetStateProperty.all(colorScheme.primary),
      ),
    );

    /// Dropdown Menu Theme
    themeData = themeData.copyWith(
      dropdownMenuTheme: buildDropdownMenuTheme(
        textStyle: themeData.textTheme.bodyLarge,
        inputDecorationTheme: themeData.inputDecorationTheme,
        backgroundColor: colorScheme.surface,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        borderRadius: BorderRadius.circular(customizasionExt.radius),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        hoverColor: Colors.grey.shade100,
      ),
    );

    /// AppBar Theme
    themeData = themeData.copyWith(
      appBarTheme: buildAppBarTheme(
        colorScheme: colorScheme,
        elevation: 0,
        iconColor: colorScheme.onPrimary,
        shadowColor: Colors.black.withOpacity(0.2),
        titleTextStyle: themeData.textTheme.titleLarge,
        centerTitle: true,
        toolbarHeight: 56,
        actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
        manageStatusBar: true,
        useScaffoldBackgroundColor:
            kIsWeb ? true : defaultTargetPlatform == TargetPlatform.iOS,
      ),
    );

    /// Input Decoration Theme
    themeData = themeData.copyWith(
      inputDecorationTheme: buildInputDecorationTheme(
        theme: themeData,
        focusedBorderColor: themeData.textTheme.bodyMedium?.color,
        errorBorderColor: themeData.textTheme.bodyMedium?.color,
        hintStyle: themeData.textTheme.bodyMedium,
        borderRadius: customizasionExt.radius,
      ),
    );

    /// Dialog Theme
    themeData = themeData.copyWith(
      dialogTheme: createEnhancedDialogTheme(
        backgroundColor: colorScheme.surface,
        elevation: 16,
        shadowColor: Colors.black.withOpacity(0.3),
        surfaceTintColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customizasionExt.radius),
        ),
        alignment: Alignment.center,
        iconColor: colorScheme.primary,
        titleTextStyle: themeData.textTheme.titleLarge,
        contentTextStyle: themeData.textTheme.bodyMedium,
        actionsPadding: const EdgeInsets.symmetric(vertical: 12),
        barrierColor: themeData.colorScheme.brightness == Brightness.light
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.4),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.antiAlias,
      ),
    );

    /// listTileTheme
    themeData = themeData.copyWith(
      listTileTheme: ListTileThemeData(
        tileColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customizasionExt.radius),
        ),
        titleTextStyle: themeData.textTheme.bodyMedium,
        subtitleTextStyle: themeData.textTheme.bodySmall,
        leadingAndTrailingTextStyle: themeData.textTheme.bodyMedium,
        iconColor: colorScheme.onPrimary,
      ),
    );

    /// Icon button theme
    // themeData = themeData.copyWith(
    //     iconButtonTheme: buildIconButtonTheme(theme: themeData));

    /// return the themeData
    return themeData;
  }
}

AppBarTheme buildAppBarTheme({
  required ColorScheme colorScheme,

  /// This new parameter allows you to toggle the AppBar color
  bool useScaffoldBackgroundColor = false,
  double elevation = 0.0,
  Color iconColor = Colors.white,
  Color shadowColor = Colors.black,
  TextStyle? titleTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  bool centerTitle = true,
  double? toolbarHeight,
  IconThemeData? actionsIconTheme,

  /// This new parameter allows you to manage the status bar visibility
  bool manageStatusBar = true,
}) {
  /// Determine AppBar background color
  final Color appBarColor =
      useScaffoldBackgroundColor ? colorScheme.surface : colorScheme.primary;

  /// Automatically adjust icon and text color based on brightness
  final bool isDark =
      ThemeData.estimateBrightnessForColor(appBarColor) == Brightness.dark;
  final Color finalIconColor = isDark ? Colors.white : Colors.black;
  final TextStyle? finalTitleTextStyle = titleTextStyle?.copyWith(
    color: isDark ? Colors.white : Colors.black,
  );

  return AppBarTheme(
    backgroundColor: appBarColor,
    elevation: elevation,
    shadowColor: shadowColor.withOpacity(0.2),
    iconTheme: IconThemeData(color: finalIconColor),
    actionsIconTheme: (actionsIconTheme ?? const IconThemeData())
        .copyWith(color: finalIconColor),
    titleTextStyle: finalTitleTextStyle,
    centerTitle: centerTitle,
    toolbarHeight: toolbarHeight,
    scrolledUnderElevation: 10,
    surfaceTintColor: shadowColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ),
  );
}

InputDecorationTheme buildInputDecorationTheme({
  required ThemeData theme,
  double borderRadius = 8.0,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  ),
  Color? fillColor, // Optional fill color, defaults to surface
  Color? focusedBorderColor, // Optional color for focused border
  Color? enabledBorderColor, // Optional color for enabled border
  Color? errorBorderColor, // Optional color for error border
  TextStyle? hintStyle, // Optional hint text style
  TextStyle? labelStyle, // Optional label text style
  TextStyle? errorStyle, // Optional error text style
  TextStyle? floatingLabelStyle, // Optional floating label style
  double enabledBorderWidth = 1.0, // Border width when enabled
  double focusedBorderWidth = 2.0, // Border width when focused
}) {
  ColorScheme colorScheme = theme.colorScheme;
  return InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: fillColor ?? colorScheme.surface, // Defaults to surface color
    contentPadding: contentPadding,

    // Border for enabled fields
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: enabledBorderColor ?? Colors.grey.shade400, // Default grey
        width: enabledBorderWidth,
      ),
    ),

    // Border for focused fields
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: focusedBorderColor ?? colorScheme.primary.withOpacity(0.5),
        width: focusedBorderWidth,
      ),
    ),

    // Border for error state
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: errorBorderColor ??
            colorScheme.error, // Error color for invalid fields
        width: enabledBorderWidth,
      ),
    ),

    // Border when focused with error
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: theme.textTheme.bodyMedium?.color ?? colorScheme.primary,
        width: focusedBorderWidth,
      ),
    ),

    // Hint text style
    hintStyle: hintStyle ??
        TextStyle(
          color: theme.textTheme.bodySmall?.color?.withOpacity(0.6) ??
              colorScheme.onSurface.withOpacity(0.6),
        ),

    // Label text style (when not floating)
    labelStyle: labelStyle ??
        TextStyle(
          color: theme.textTheme.labelLarge?.color ??
              colorScheme.onSurface.withOpacity(0.6),
        ),

    // Floating label style (when label floats above)
    floatingLabelStyle: floatingLabelStyle ??
        TextStyle(
          color: focusedBorderColor ??
              colorScheme.primary, // Matches focused border
          fontWeight: FontWeight.w600,
        ),

    // Error text style
    errorStyle: errorStyle ??
        TextStyle(
          color: errorBorderColor ??
              colorScheme.error, // Error text matches border
          fontWeight: FontWeight.w500,
        ),
  );
}

DropdownMenuThemeData buildDropdownMenuTheme({
  TextStyle? textStyle,
  InputDecorationTheme? inputDecorationTheme,
  Color? backgroundColor,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? borderRadius,
  double elevation = 4.0,
  Color? shadowColor,
  Color? hoverColor,
}) {
  return DropdownMenuThemeData(
    textStyle: textStyle ??
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
    inputDecorationTheme: inputDecorationTheme ??
        InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200, // Default fill color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor ?? Colors.white),
      shadowColor:
          WidgetStateProperty.all(shadowColor ?? Colors.black.withOpacity(0.2)),
      elevation: WidgetStateProperty.all(elevation),
      padding: WidgetStateProperty.all(padding ?? const EdgeInsets.all(8.0)),
      minimumSize: WidgetStateProperty.all(const Size(100, 40)),
      maximumSize: WidgetStateProperty.all(const Size(double.infinity, 300)),
      side: WidgetStateProperty.all(BorderSide(color: Colors.grey.shade300)),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      )),
      mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  );
}

DialogTheme createEnhancedDialogTheme({
  Color? backgroundColor,
  double? elevation,
  Color? shadowColor,
  Color? surfaceTintColor,
  ShapeBorder? shape,
  AlignmentGeometry? alignment,
  Color? iconColor,
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  EdgeInsetsGeometry? actionsPadding,
  Color? barrierColor,
  EdgeInsets? insetPadding,
  Clip? clipBehavior,
  BorderRadiusGeometry? borderRadius,
  Gradient? backgroundGradient,
  IconThemeData? iconTheme,
}) {
  return DialogTheme(
    backgroundColor: backgroundColor ?? Colors.white,
    elevation: elevation ?? 16.0,
    shadowColor: shadowColor ?? Colors.black.withOpacity(0.3),
    surfaceTintColor: surfaceTintColor,
    shape: shape ??
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
        ),
    alignment: alignment,
    iconColor: iconColor,
    titleTextStyle: titleTextStyle ??
        const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
    contentTextStyle: contentTextStyle ??
        const TextStyle(
          fontSize: 16.0,
          color: Colors.black87,
        ),
    actionsPadding:
        actionsPadding ?? const EdgeInsets.symmetric(vertical: 12.0),
    barrierColor: barrierColor ?? Colors.black54,
    insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 20.0),
    clipBehavior: clipBehavior ?? Clip.antiAlias,
  );
}

IconButtonThemeData buildIconButtonTheme({
  required ThemeData theme,
}) {
  return IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.red;
          } else if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return Colors.blue; // default icon color
        },
      ),
      iconSize: WidgetStateProperty.all(24.0), // default icon size
      splashFactory: InkRipple.splashFactory, // Ripple effect on press
      padding: WidgetStateProperty.all(const EdgeInsets.all(12.0)),
    ),
  );
}

class AppColors {
  // Primary Colors
  static const Color deepCeruleanBlue = Color(0xFF0077B6);
  static const Color illuminatingYellow = Color(0xFFF4D35E);
  static const Color spaceCadetNavy = Color(0xFF2B2D42);

  // Secondary Colors
  static const Color seafoamGreen = Color(0xFF88E1B7);
  static const Color softCoral = Color(0xFFF76C5E);
  static const Color lavenderBlush = Color(0xFFFDEBFC);

  // Accent Colors
  static const Color sunsetOrange = Color(0xFFFF6F61);
  static const Color lightStoneGray = Color(0xFFE0E2DB);

  // Text Colors
  static const Color onyxBlack = Color(0xFF202020);
  static const Color charcoalGray = Color(0xFF595959);
  static const Color whiteSmoke = Color(0xFFF5F5F5);

  // Background Colors
  static const Color snowWhite = Color(0xFFFAFAFA);
  static const Color cloudyBlue = Color(0xFFB0BEC5);
  static const Color nightSky = Color(0xFF121212);
}
