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

- GoRouter 는 nested 되어있는 구조의 라우터를 그대로 그려주는 장점을 가지고 있다.
- push 는 현재 라우터 스택 상태에서 이동하는 스크린을 추가하는 형태로 이동한다.
- go 는 라우터 구조 형태 대로 라우터 스택을 새로 생성한다.

    ```
        <!-- push_screen 에서 context.go('/basic') 을 하면 라우터 구조 형태로 새로 생성된다.  -->

        ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text('Go Basic'),
        ),

        <!-- push_screen 에서 context.push('/basic') 을 하면 현재 라우터 구조 위에 추가가 된다. -->

        ElevatedButton(
            onPressed: () {
                context.push('/basic');
            },
            child: const Text('Push Basic'),
        ),
    ```
</details>

## 5. Pop 함수
<details>
<summary> 내용 보기</summary>
<br>

- pop 함수를 사용하면 현재 라우터 스택에서 뒤로 한칸 갈수 있다.
- pop 함수에 파라미터를 전달하면 pop 으로 이동되는 화면에서 받아볼수 있다.
- push 에서는 async 와 await 를 사용해서 값을 기다려야 한다.

    ```
        <!-- Push -->

        ElevatedButton(
            onPressed: () async {
                final result = await context.push('/pop/return');

                print(result);
            },
            child: const Text('Push Pop Return Screen'),
        ),

        <!-- Pop -->

        ElevatedButton(
            onPressed: () {
              context.pop('Walking!!');
            },
            child: const Text('Pop'),
        ),
    ```
</details>

## 6. Path Parameters
<details>
<summary> 내용 보기</summary>
<br>

- path 에 : 를 사용해서 변수를 받을수 있다.
- GoRouterState.of(context) 를 사용하면 라우터의 상태를 가지고 올수 있다.
- GoRouter 에서는 builder 안의 return widget 이 중요한게 아니라 path 가 중요하다.

    ```
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            ),
          ],
        ),


        Text('Path Param : ${GoRouterState.of(context).pathParameters}'),        
    ```
</details>

## 7. Query Parameters
<details>
<summary> 내용 보기</summary>
<br>

- Query Parameter 는 map 형식으로 쿼리스트링을 전달한다.
- context.push 를 할때 Uri() 를 사용하여 path 와 queryParameters 를 설정한다.
- Query Parameter 역시 GoRouterState.of(state) 에서 확인할수 있다.
    ```
        Text('Query Parameter : ${GoRouterState.of(context).queryParameters}'),

        onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'walkerJung',
                    'age': '31',
                  },
                ).toString(),
            );
        }, 
    ```
</details>

## 8. Shell Route
<details>
<summary> 내용 보기</summary>
<br>

- 이론적으로는 네비게이터를 중첩시켜 사용하는 기능이다.
- ShellRoute 는 builder 와 routes 필드를 설정하여 구성할수 있다.
- builder 에는 child 파라미터가 추가되고, 이 child 들로 구성된다.
- builder 에서 파라미터로 받고있는 child 는 routes 속성에 있는 라우트들을 의미한다.

    ```
        <!-- NestedScreen 을 NestedChildScreen 들로 구성한 상태 -->

        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            )
          ],
        )
    ```
</details>

## 9. Redirection
<details>
<summary> 내용 보기</summary>
<br>

- GoRouter 에 redirect 속성을 사용해서 스크린 이동이 제한되어야 하는 상태일때 redirect 를 시킬수 있다.
- redirect 는 context 와 state 를 인자로 받고, state 는 GoRouterState 이다.
- return 을 string 으로 하면 해당 path 로 이동한다.
- return 을 null 로 하면 이동하려던 path 로 이동한다.
- GoRouter 의 redirect 속성은 모든 라우트 전체에 적용이된다.
- 위와 같은 방법으로 똑같이 GoRoute 에도 redirect 를 사용하면, 해당 라우트로 이동할때만 redirect 를 사용한다.

    ```
        <!-- 전체 라우터에 적용되는 redirect -->

        final router = GoRouter(
            redirect: (context, state) {
                // return string (path) -> 해당 라우트로 이동한다.
                // return null -> 이동하려던 라우트로 이동한다.
                if (state.location == '/login/private' && !authState) {
                return '/login';
                }
                return null;
            }
            ...
        )

        <!-- 해당 라우트로 이동할때 적용되는 redierect -->

        GoRoute(
            path: 'private',
            builder: (context, state) {
                return const PrivateScreen();
            },
            redirect: (context, state) {
                if (!authState) {
                    return '/login2';
                }
                return null;
            },
        )
    ```
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