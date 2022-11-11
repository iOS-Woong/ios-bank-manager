# 🏦 은행창구매니저

## 📖 목차

1. [팀 소개](#팀소개)
2. [기능 소개](#기능소개)
3. [Diagram](#Diagram)
4. [기술적 도전](#기술적도전)
5. [트러블 슈팅](#트러블슈팅)
6. [참고 링크](#참고링크)

## 팀소개

 |[준호](https://github.com/junho15)|[woong](https://github.com/iOS-Woong)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/CeXUOId.png">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/96489602?v=4">|

- `준호`와 `woong` 팀이 만든 은행창구 매니저입니다.

## 기능소개

 |**ConsoleApp작동**|
 |:---:|
 |![](https://i.imgur.com/UXiJMUG.gif)|

## Diagram

### 🧬 UML

![은행창구 매니저 ClassDiagram](https://github.com/iOS-Woong/ios-bank-manager/blob/step-3/UML.jpg?raw=true)

<details>
<summary>1. Node</summary>
<div markdown="1">
- 데이터를 저장해줄 `data` 변수 / 다음 데이터의 주소값을 저장해줄 `next` 변수로 구성하였습니다.<br />
- 다음  의 주소값을 저장하기 위해 struct대신 reference type인 class로 구현하였습니다.<br />
- `data` 프로퍼티는 외부에서 접근하여 읽기만 하기 때문에 `private(set)` 키워드를 추가했습니다.<br />
- `Node` 클래스는 더 이상 상속하지 않기때문에 class 앞에 `final` 키워드를 추가했습니다.
</div>
</details>

<details>
<summary>2. LinkedList</summary>
<div markdown="1">
- `Node` 를 연결한 자료 구조형을 만들었습니다.<br />
- class로 구현해줄 마땅한 이유가 없어서 struct로 구현하였습니다.<br />
- 첫 노드를 가리키는 `head` 와 마지막 노드를 가리키는 `tail` 프로퍼티를 만들었습니다.<br />
- `head` 와 `tail` 프로퍼티에는 구현한 범위 밖에서 접근하지 못하도록 private 키워드를 추가했습니다.<br />
- 첫 노드의 값을 반환하는 `firstValue` 와 `LinkedList가` 비었는지 확인하는 `isEmpty` 연산 프로퍼티를 만들었습니다.<br />
- 끝에 노드를 추가하는 `addLast()`, 첫 번째 노드를 빼는 `removeFirst()`, 모든 노드를 지워주는 `removeAll()` 메서드를 만들었습니다.
</div>
</details>
<details>
<summary>3. Queue</summary>
<div markdown="1">
- 요구사항에 따라 `isEmpty`, `enqueue`, `dequeue`, `clear`, `peek` 을 구현하였습니다.<br />
- 다양한 데이터를 취급할 수 있도록 `Generic` 타입을 활용하였습니다.<br />
- `deposit`을 담당하는 은행원과 `loan`을 담당하는 은행원의 처리업무가 동시에 처리되는 것을 방지하기 위해 접근가능 스레드의 수를 제한을 의도로 `DispatchSemaphore`를 활용하였습니다.<br />
- `DispatchSemaphore`의 `value`값을 활용하기 위해 큐에 담긴 `Element`의 개수에 접근해야했고, 따라서,`count` 프로퍼티를 추가했습니다.
</div>
</details>
<details>
<summary>4. BankBusiness</summary>
<div markdown="1">
- 은행 업무(예금, 대출)을 열거형으로 만들었습니다.<br />
- 랜덤 값을 반환하는 `allCases.randomElement()`메서드를 사용하기 위해 `CaseIterable` 프로토콜을 채택했습니다.
</div>
</details>
<details>
<summary>5. Customer</summary>
<div markdown="1">
- 프로퍼티 `number` 는 은행에 온 고객을 대기번호를 기준으로 생각하여 `Int` 타입으로 만들었습니다.<br />
- 고객이 원하는 업무(대출, 예금)를 구분하기 위해서 `BankBusiness` 타입의 인스턴스를 갖도록 하였습니다.
</div>
</details>
<details>
<summary>6. Banker</summary>
<div markdown="1">
- 업무 처리 시 `Thread.sleep(forTimeInterval: Double)` 메서드를 지연함수로 채택하였습니다.<br />
- 은행원이 처리할 수 있는 업무(대출, 예금)를 구분하기 위해서 `BankBusiness` 타입의 인스턴스를 갖도록 하였습니다.
</div>
</details>
<details>
<summary>7. BankManager</summary>
<div markdown="1">
- `Bank` 의 인스턴스를 프로퍼티로 가지고, `Bank` 를 관리하고 실행하기 위한 기능을 가진 구조체를 만들었습니다.<br />
- `addCustomers()` 메서드에는 전달 받은 `count` 만큼 `Customer` 를 만들어서 `bank` 에 추가해주는 기능을 구현했습니다.<br />
- `addBankers()` 메서드에는 전달 받은 업무를 처리하는 `Banker` 를 `count` 만큼 만들어서 `bank` 에 추가해주는 기능을 구현했습니다.<br />
- `startBank()` 메서드에는 `bank` 가 업무를 시작하도록 하는 기능을 구현했습니다.
</div>
</details>
<details>
<summary>8. Bank</summary>
<div markdown="1">
- 고객 대기열을 저장하기 위해 `Queue<Customer>` 타입의 `customerQueue` 프로퍼티를 추가했습니다.<br />
- 총 업무시간(함수의 실행시간)을 측정하기 위한 저장 프로퍼티 `startTime`, `endTime`를 추가했습니다.<br />
- 고객 대기열에 고객을 추가하는 `addCustomerToQueue()` 메서드와 은행원 큐에 은행원을 추가하는 `addBanker()` 메서드를 만들었습니다.<br />
- `printClosingMessage()` 메서드에는 업무 마감시 처리한 고객과 총 업무시간을 출력해주는 기능을 구현했습니다.<br />
- `startBankBusiness()` 메서드 내부 처음과 끝에서 `startTime`, `endTime` 에 시간을 설정해주고 `printClosingMessage()` 메서드 호출 시 `startTime`, `endTime` 사이의 interval 출력하도록 했습니다.<br />
- `String(format:)` 을 사용해서 예시 화면처럼 총 업무시간 출력 시 소수점 아래 두자리까지 무조건 보이도록 했습니다.<br />
- `processBankingBusinessOfCustomers()` 메서드는 고객 대기열에서 한명씩 고객을 `dequeue` 한 뒤 `Banker` 에게 전달하여 고객의 업무를 처리 할 수 있도록 구현하였습니다.<br />
- 고객 업무 처리 시 은행원을 `dequeue` 하여 은행원이 업무를 처리하도록 한 뒤 다시 `enqueue` 하여 제일 마지막 순서로 가도록 했습니다. 이렇게하면 은행원이 순환하면서 업무를 처리할 수 있었습니다.<br />
- `DispatchSemaphore`는 자원에 접근할 수 있는 스레드의 수를 제어해주는 역할을 합니다. `startBankBusiness()` 메서드에서는 업무별로 `depositSemaphore`, `loanSemaphore`를 두어서 스레드의 수를 각 은행원의 수만큼 제한하도록 했습니다.<br />
- `DispatchGroup` 은 비동기적으로 처리되는 작업들을 그룹으로 묶어, 그룹 단위로 작업 상태를 추적할 수 있는 기능입니다. `startBankBusiness()` 메서드에서는 `DispatchGroup`으로 예금 업무 처리 작업과 대출 업무 처리 작업을 묶었습니다. 그리고 `wait()` 로 모든 작업이 끝났는 지를 확인해서 `printClosingMessage()` 를 호출하도록 했습니다. `wait()` 는 `DispatchGroup` 의 작업이 끝나기를 기다리는 메서드입니다.<br />
- 업무 처리는 `DispatchQueue.global().async()` 로 구현하였습니다. 각각의 은행원이 새로운 스레드에서 `global()` 다음 작업을 기다리지 않고 업무를 처리할 수 있도록 비동기로 `async()` 만들어야 했기에 위 방식으로 구현하였습니다.
</div>
</details>
<details>
<summary>9. ConsolAppMenu</summary>
<div markdown="1">
- 콘솔앱에서 사용하는 메뉴를 열거형으로 만들었습니다.
</div>
</details>
<details>
<summary>10. ConsolApp</summary>
<div markdown="1">
- 콘솔앱을 실행하고 관리하기 위해 콘솔앱 구조체를 만들었습니다<br />
- `inputMenu()` 메서드와 `start()` 메서드에서는 재귀함수를 활용했습니다. 재귀 함수는 함수 안에서 스스로를 호출하는 형태를 말합니다. 재귀함수에서는 탈출 조건이 중요해서 그 부분을 신경써서 구현했습니다.<br />
- `startBankByCreatingBankManager()` 메서드에는 `BankManger` 를 `reset()` 하고 10~30명 사이 숫자의 고객과, 은행원을 추가 한 뒤, 고객의 업무를 처리하는 기능을 구현했습니다.
</div>
</details>

## ✅ 프로젝트 수행 핵심경험

### Step1

 Linked-list 자료구조의 이해 및 구현
 Queue 자료구조의 이해 및 구현
 Generics 개념이해 및 적용

### Step2

 Queue의 활용
 타입 추상화 및 일반화

### Step3

 동기(Synchronous)와 비동기(Asynchronous)의 이해
 동시성 프로그래밍 개념의 이해
 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
 스레드(Thread) 개념에 대한 이해
 GCD를 활용한 동시성 프로그래밍 구현
 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

<br>

## 기술적도전

[Queue, LinkedList, Node의 활용](https://github.com/iOS-Woong/ios-bank-manager/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81%EB%8F%84%EC%A0%84-&-%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%85#queue-linkedlist-node%EC%9D%98-%ED%99%9C%EC%9A%A9)

[GCD를 활용한 동시성 프로그래밍 구현](https://github.com/iOS-Woong/ios-bank-manager/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81%EB%8F%84%EC%A0%84-&-%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%85#gcd%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%9C-%EB%8F%99%EC%8B%9C%EC%84%B1-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%EA%B5%AC%ED%98%84)

<br>

## 트러블슈팅

[UnitTest 관련 오류: TargetMembership 설정](https://github.com/iOS-Woong/ios-bank-manager/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81%EB%8F%84%EC%A0%84-&-%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%85#unittest-%EA%B4%80%EB%A0%A8-%EC%98%A4%EB%A5%98-targetmembership-%EC%84%A4%EC%A0%95)

[`Array<Banker>` -> `Queue<Banker>`로 변경](https://github.com/iOS-Woong/ios-bank-manager/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81%EB%8F%84%EC%A0%84-&-%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%85#arraybanker---queuebanker%EB%A1%9C-%EB%B3%80%EA%B2%BD)

[비동기 처리시 프로퍼티 값 수정 관련](https://github.com/iOS-Woong/ios-bank-manager/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81%EB%8F%84%EC%A0%84-&-%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%85#%EB%B9%84%EB%8F%99%EA%B8%B0-%EC%B2%98%EB%A6%AC%EC%8B%9C-%ED%94%84%EB%A1%9C%ED%8D%BC%ED%8B%B0-%EA%B0%92-%EC%88%98%EC%A0%95-%EA%B4%80%EB%A0%A8)

<br>

## 참고링크

- [공식문서 - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

- [공식문서 - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)

- [공식문서 - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
