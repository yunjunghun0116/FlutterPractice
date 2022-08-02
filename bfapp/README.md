# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

기기                          서버
accessToken->유저정보요청     데이터 받은 후에 1. 유효성 체크 2. 데이터 리턴 (유저정보 or false)
유저정보 : 자동로그인
false : refreshToken -> accessToken초기화 요청
                          refreshToken 검수 -> accessToken or false
false : 처음부터 다시 로그인
accessToken 으로 다시 정보요청


1. 위에서부터 작성된 순서대로 코드를 수행
2. async/await
