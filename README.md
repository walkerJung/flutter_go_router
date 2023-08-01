# [Go Router v7] GoRouter 이론

## 1. 프로젝트 세팅하기
<details>
<summary> 내용 보기</summary>
<br>

- pubspec.yaml 에 go_router 의존성을 추가한다.
- route/router.dart 파일을 만들고 GoRouter 클래스를 사용하여 router 를 만든다.
- GoRouter 의 route 속성에는 GoRoute 들이 들어간다.

    ```
        final router = GoRouter(
            routes: [
                GoRoute(
                    path: '/',
                    builder: (context, state) {
                        return const RootScreen();
                    },
                )
            ],
        );
    ```
- main.dart 에서 MaterialApp.router 를 return 해준다.

    ```
        Widget build(BuildContext context) {
            return MaterialApp.router(
                routerConfig: router,
            );
        }
    ```
- 보통 '/' path 가 기본 default path 이다.
</details>

## 2. Go 함수
<details>
<summary> 내용 보기</summary>
<br>

- GoRoute 안에 routes 속성에 다시 GoRoute 를 추가할수 있다.

    ```
        GoRoute(
            path: '/',
            builder: (context, state) {
                return const RootScreen();
            },
            routes: [
                GoRoute(
                    path: 'basic',
                    builder: (context, state) {
                        return const BasicScreen();
                    },
                )
            ],
        )    
    ```
- 스크린 이동이 일어나야 하는 곳에서 context.go('/path') 를 사용하면 된다.

    ```
        onPressed: () {
            context.go('/basic');
        },
    ```
</details>

## 3. Go Named 함수
<details>
<summary> 내용 보기</summary>
<br>

- GoRoute 의 name 속성을 사용하면 라우터에 이름을 지정하여 이동할수 있다.
- 라우터 경로가 길어질 경우 goNamed 함수를 사용하는게 편하다.

    ```
        <!-- name 속성에 라우터 이름 정의 -->

        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          },
        ),

        <!-- 사용하는 부분 -->

        onPressed: () {
            context.goNamed('named_screen');
        },
    ```

</details>

## 4. Push 함수
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 5. Pop 함수
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 6. Path Parameters
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 7. Query Parameters
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 8. Shell Route
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 9. Redirection
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 10. Transition Animation
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 11. Error Screen
<details>
<summary> 내용 보기</summary>
<br>

-

</details>

## 12. Logging
<details>
<summary> 내용 보기</summary>
<br>

-

</details>