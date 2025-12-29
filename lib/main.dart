import 'package:flutter/material.dart'; // 플러터 기본 UI 라이브러리

import 'package:firebase_core/firebase_core.dart'; // 파이어베이스 코어 (초기화를 위해 필요)

import 'package:provider/provider.dart'; // 상태 관리 라이브러리 (데이터를 앱 전체에 뿌려주기 위해 필요)

import 'firebase_options.dart'; // 우리가 만든 파이어베이스 설정 파일 (자동 생성됨)

// 우리가 만든 라우터 파일
import 'core/router.dart';
import 'core/app_theme.dart';

// - async가 붙은 이유: Firebase 초기화가 네트워크/디스크를 쓰기 때문에 '비동기(기다림)' 처리가 필요해서입니다.
void main() async {
  // 플러터 엔진 초기화
  // - 원래 runApp()을 호출하면 플러터 엔진이 알아서 켜집니다.
  // - 하지만 우리는 runApp() 전에 Firebase.initializeApp()을 호출해야 합니다.
  // - Firebase는 네이티브(Android/iOS/Web) 코드를 사용하므로,
  //   플러터 엔진과 네이티브가 통신할 수 있는 다리(Binding)를 미리 연결해두는 명령어입니다.
  WidgetsFlutterBinding.ensureInitialized();

  // 파이어베이스 초기화
  // - 이제 구글 서버와 연결할 준비를 합니다.
  // - options: 현재 플랫폼(웹인지 앱인지)에 맞는 설정값을 넣어줍니다.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 앱 실행
  // - 여기서부터 UI(위젯)가 그려지기 시작합니다.
  runApp(const MyApp());
}

// MyApp (루트 위젯)
// - 앱의 최상위 조상입니다. 여기서 전역 설정(테마, 라우팅, 데이터 공급)을 합니다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider (전역 상태 관리소)
    // - "의존성 주입(Dependency Injection)"과 비슷합니다.
    // - 여기서 선언한 데이터는 앱의 어디서든 접근할 수 있습니다.
    // - 나중에 'User 정보'나 '로그인 상태'를 여기서 관리합니다.
    return MultiProvider(
      providers: [
        // 지금은 임시 데이터. 나중에 Provider<AuthService>(...) 등이 들어갑니다.
        Provider(create: (_) => 'Hello Provider'),
      ],
      // MaterialApp (앱의 겉포장)
      // - 안드로이드/웹 스타일의 디자인 시스템을 적용합니다.
      // - .router 생성자를 쓰는 이유: GoRouter 패키지를 쓰기 때문입니다.
      child: MaterialApp.router(
        title: 'Developer Portfolio', // 브라우저 탭에 뜨는 이름
        debugShowCheckedModeBanner: false, // 우측 상단 'Debug' 띠 제거
        routerConfig: router, // 라우터 설정 연결 (길 안내 지도 전달)
        // 테마 설정 (Dark Mode)
        // - 앱 전체의 색상, 폰트를 여기서 한 번에 관리합니다.
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
