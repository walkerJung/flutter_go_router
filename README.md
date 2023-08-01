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

-

</details>

## 3. Go Named 함수
<details>
<summary> 내용 보기</summary>
<br>

-

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