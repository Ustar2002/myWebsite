import 'package:flutter/material.dart';

// 색상 팔레트 (Colors)
// - 앱에서 쓰는 모든 색을 여기서 변수(static const)로 관리합니다.
// - 헥사 코드(#)를 0xFF 뒤에 붙여서 사용합니다.
abstract class AppColors {
  // 배경색
  static const Color background = Color(0xFF121212); // 아주 짙은 회색
  static const Color surface = Color(0xFF1E1E1E); // 카드, 앱바 배경

  // 포인트 컬러 (Cyberpunk Neon)
  static const Color primary = Color(0xFF00E676); // 네온 그린 (메인)
  static const Color secondary = Color(0xFF00B0FF); // 네온 블루 (보조)
  static const Color error = Color(0xFFCF6679); // 에러 색상

  // 텍스트 색상
  static const Color textPrimary = Color(0xFFFFFFFF); // 흰색
  static const Color textSecondary = Color(0xFFB3B3B3); // 회색 (보조 설명)
}

// 텍스트 스타일 (Typography)
// - 폰트 종류와 두께 등을 미리 정의합니다.
abstract class AppTextStyles {
  static const String fontFamily = 'Pretendard';

  // 제목용 스타일
  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // 본문용 스타일
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5, // 줄 간격
  );

  // 코드 블록용 (나중에 필요하면 추가)
  // static const TextStyle code = ...
}

// 테마 데이터 (ThemeData)
// - main.dart에서 가져다 쓸 완성된 테마 객체입니다.
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Pretendard', // 앱 전체 기본 폰트 설정
      // 색상 적용
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,

      // ColorScheme (머티리얼 컴포넌트들이 자동으로 참조하는 색상표)
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
      ),

      // AppBar 전역 스타일
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),

      // 텍스트 테마 (TextTheme)
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        bodyMedium: AppTextStyles.body,
      ),
    );
  }
}
