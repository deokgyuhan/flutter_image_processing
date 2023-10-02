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

