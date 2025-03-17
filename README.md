# EyeForYou (업데이트 버전)
시각장애인을 위한 AI 기반 카메라 서비스

<br><br>

## 🔗 업데이트 개요

이 프로젝트는 기존 EyeForYou 프로젝트를 개선하여 코드 구조를 최적화하고, MVVM 패턴 및 Provider를 적용하여 유지보수성을 향상시킨 버전입니다.<br>
[이전 프로젝트 보러가기](https://github.com/lyuhw1023/EyeForYouapp_FrontEnd)

<br>

## ✅ 주요 업데이트 내용

- MVVM 패턴 적용: 전체적인 코드 구조를 개선하여 데이터 흐름을 명확하게 정리하고 유지보수성을 향상
- Provider 적용: 전역 상태 관리를 최적화하여 데이터 흐름을 정리하고 UI 업데이트 성능 개선.
- 혜택 정보 관리 최적화: JSON 데이터를 활용하여 중복된 페이지 35개 → 단일 리스트 화면으로 개선
- 웹 크롤링 도입: 기존 수작업 입력 방식에서 크롤링을 활용하여 혜택 데이터를 보다 효율적으로 관리할 수 있도록 변경
- UI/UX 개선: Custom AppBar 및 Option Card 등을 적용하여 재사용성을 높이고 UI 구조 최적화

<br>

## 🚀 프로젝트 개요
> EyeForYou는 시각장애인이 편의점이나 마트에서 상품을 인식하고 정보를 음성으로 안내받을 수 있는 AI 카메라 앱입니다. 사용자는 카메라를 통해 상품을 촬영하면 AI가 자동으로 상품을 인식하여 상품의 이름 및 정보를 음성으로 안내합니다.
> 또한, 시각장애인을 위한 복지 혜택 정보를 쉽게 검색할 수 있도록 기능을 제공하여, 사용자 맞춤형 정보를 빠르게 찾을 수 있도록 지원합니다.

<br>

## 🔥 업데이트 효과

1️⃣ MVVM 패턴 적용

- UI와 로직을 분리하여 유지보수성과 확장성을 개선
- Camera 및 혜택 정보 관리(Selection, List)에 MVVM 구조 적용
- View → ViewModel → Model 흐름을 명확히 정리

<br>

2️⃣ Provider 적용 (상태 관리 최적화)

- 전역 상태 관리를 통해 데이터 흐름을 개선하고 UI 업데이트 성능 향상
- Camera, Selection, List 관련 상태 관리 적용
- 데이터 로딩 및 오류 처리 (isLoading, errorMessage) 효율적 관리

<br>

3️⃣ 중복된 페이지 제거 및 JSON 데이터 활용

- 기존 개별 페이지(60개+) 제거 → 동적 리스트 페이지로 통합
- 선택한 조건(중증/경증, 생애주기, 복지 서비스)에 따라 JSON 데이터 필터링 적용
- 코드 중복 최소화 및 유지보수 용이

<br>

4️⃣ 웹 크롤링 활용한 혜택 정보 자동화

- 기존 수작업 입력 방식 → 웹 크롤링을 활용한 JSON 데이터 관리 방식으로 개선
- 최신 혜택 정보를 보다 빠르고 효율적으로 반영 가능

<br>

5️⃣ UI/UX 개선 (Custom UI 컴포넌트 도입)
- CustomAppBar 적용 → 일관된 UI 및 도움말 기능 추가
- OptionCard 및 BenefitCard 도입 → 선택 화면 및 혜택 정보 리스트 최적화
- VoiceOver 및 접근성 태그 적용 → 음성 안내 및 UI 가독성 향상

<br><br>

📌 프로젝트 기능 소개<br>
🎯 1. AI 카메라를 통한 상품 인식

<img src="https://github.com/user-attachments/assets/42c357e2-c479-42c6-8e40-435d800936c8" width="200px"/>
<img src="https://github.com/user-attachments/assets/fed7870e-06d9-432f-8990-d325d307fbf5" width="200px"/>
<img src="https://github.com/user-attachments/assets/ed97d057-ef8c-4284-b062-6b15c3aba568" width="200px"/>

> 사용자가 카메라 화면을 터치하면 AI가 상품을 인식하고 음성으로 안내<br>
> 상품 코너(스낵, 음료 등)까지 인식하여 사용자가 위치를 파악할 수 있도록 지원<br>
> AI 모델 최적화 → 4:3 비율 자동 크롭 적용하여 정확도 개선<br><br>

🎯 2. 맞춤형 복지 혜택 정보 제공

<img src="https://github.com/user-attachments/assets/69b0da59-a784-46f2-88ed-01e7f64d7ef2" width="200px"/>
<img src="https://github.com/user-attachments/assets/82725957-d782-4953-985a-c0cffbe27a37" width="200px"/>
<img src="https://github.com/user-attachments/assets/cc4961fc-0f5d-403f-8245-276f65023ebc" width="200px"/>

> 중증/경증 + 생애주기/복지 서비스 선택 후 맞춤형 혜택 정보 제공<br>
> JSON 데이터를 활용하여 동적 필터링 및 리스트 구성<br>
> 웹 크롤링을 활용한 데이터 자동화 → 최신 혜택 정보 유지 가능<br><br>

🎯 3. 접근성을 고려한 UI/UX
> VoiceOver 지원 → 시각장애인을 위해 음성 안내 기능 추가<br>
> Semantics 태그 적용 → 화면 요소를 음성으로 읽어줄 수 있도록 개선<br>
> CustomAppBar, CustomCard 적용 → 일관된 UI 제공 및 유지보수성 향상

<br><br>

📌 프로젝트 비교 (Before vs After)

|기존 프로젝트|개선된 프로젝트|
|:---:|:---:|
|상품 촬영 후 모든 화면이 하나의 파일에 포함됨|CameraViewModel로 로직 분리(MVVM 적용)|
|혜택 결과 페이지가 35개 개별 파일로 존재|JSON 데이터 활용하여 단일 리스트 페이지 유지|
|setState 남용로 성능 저하|Provider 적용으로 상태 관리 최적화
|웹에서 직접 복사/붙여넣기 하여 데이터 입력|웹 크롤링 도입하여 효율적으로 관리||


