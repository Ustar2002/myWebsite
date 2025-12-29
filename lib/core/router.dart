import 'package:flutter/material.dart'; // UI 도구 상자 (Widget, BuildContext)
import 'package:go_router/go_router.dart'; // 라우팅 라이브러리
import '../views/home/home_view.dart'; // 홈 화면

final router = GoRouter(
  initialLocation: '/', // 앱이 처음 켜졌을 때 보여줄 경로 (기본값: '/')
  // 경로 목록
  routes: [
    GoRoute(
      path: '/', // 주소창에 찍힐 URL (예: www.mysite.com/)
      name: 'home', // 코드 내부에서 부를 별명
      // 빌더: 해당 주소로 왔을 때 '실제로 무엇을 그릴지' 함수로 정의
      // - context: 현재 위젯 트리의 위치 정보
      // - state: URL에 포함된 파라미터 정보 (예: /blog/123 에서 '123'을 꺼낼 때 사용)
      builder: (context, state) =>
          const HomeView(), // 여기서 반환(return)하는 위젯이 화면에 뜹니다.
    ),
  ],
);
