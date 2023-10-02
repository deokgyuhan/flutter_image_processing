# flutter_image_processing

"flutter_image_processing plugin project."

## 작업일지

### 2023.10.02
* pub.dev에서 플러그인 이름 충돌안나게 확인한후 프로젝트 생성후 깃허브 게시.. 일단 기본 기능만 만들어놓고 업데이트중으로 하고 pub.dev에 올려야 될것 같다. 
  
  이유는 그사이에 내가 만들어놓은 플러그인 이름을 다른 개발자가 먼저 만들고 올릴 수도 있으므로...


* 기본 필터 가우시안/블러 만들어서 오늘중에 일단 게시하도록.. 다만 개발중으로 README에 안내하고


* 개발환경 마무리하고 flutter pub run ffigen --config ffigen.yaml 실행


* chmod 755 init.sh -> chmod 755 update_ios.sh -> init.sh 실행


* ios에 opencv.framework 삭제


* .gitignore에 아래 디렉토리 추가후 커밋
  /ios/opencv2.framework/
  /src/include/
  /android/src/main/jniLibs/


* 이제 순차적으로   /src/include/, /android/src/main/jniLibs/ 주석처리하고 github 커밋


git 명령어 참조
```
>  git lfs install
>  git lfs track "*.so"
>  git add .gitattributes

>  git lfs track "*.h"
>  git lfs track "*.hpp"
>  git add .gitattributes
```


* 먼저 /android/src/main/jniLibs/ 주석처리하고 lib *.so를 커밋 


* 다음 /src/include/ 주석처리하고 *.h *.hpp 커밋, 이때는 50~100개씩 나눠서 커밋 


* 그 다음 나머지 2개 함수인 GaussianBlur, CannyDetector 연결하고 예제코드 간단히 작성.


* 시뮬레이터에 테스트하기.. 안드로이드에서 우선 테스트하고 아이폰은 시뮬레이터에서 테스트가 안되고 내 아이폰도 한달전부터 설치가 안되서 일단 빌드만 정상적인지 테스트
 -> 빌드 에러 ... vscode 에서 한번은 src 폴더에서 cmake build 를 해줘야 할것 같다. 일단 해보고나서 다시 기재
 -> 위에 사항을 진행한다음에 안드로이드 빌드하니까 성공. 이제 IOS도 빌드 성공


* 이제 안드로이드 시뮬레이터에서 테스트하고 README 작성하고 빨리 pub.dev에 초기버전 게시하고 flutter_image_processing를 선점하자


* 시뮬레이터 테스트 성공... 디바이스도 테스트해보자 지금 그냥 한번 pub publish 테스트해보자


* Do you want to publish flutter_image_processing 0.0.1 to https://pub.dev (y/N)? y
  Uploading... (16.8s)
  Uncompressed package archive is too large (size > 104857600).
  -> x86 제외


* 디바이스에 실제 테스트하고 pub.dev에 초기버전 게시하고 README 간단히 작성한다음에 버전업하면서 필터 계속 추가예정이라고 명시하고 다시 게시


* 안드로이드 12 디바이스 테스트 성공...


* 일단 flutter_image_processing로 pub.dev에 초기 버전 게시 완료.. 플러그인 이름은 확보되었고 이제 계속 업데이트해가면 됨


* README 작성하고 나서 다시 게제
