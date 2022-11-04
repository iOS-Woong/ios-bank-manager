# 🏦 은행창구매니저


## 📖 목차
1. [팀 소개](#-팀-소개)
2. [기능 소개](#-기능-소개)
3. [Diagram](#-Diagram)
4. [폴더 구조](#-폴더-구조)
5. [타임라인](#-타임라인)
6. [트러블 슈팅](#-트러블-슈팅)
7. [기술적 도전](#-기술적-도전)
8. [참고 링크](#-참고-링크)


## 🌱 팀 소개
 |[준호](https://github.com/junho15)|[woong](https://github.com/iOS-Woong)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/CeXUOId.png">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/96489602?v=4">|

- `준호`와 `woong` 팀이 만든 은행창구 매니저입니다.

## ⚒️ 기능 소개
 |**ConsoleApp작동**|
 |:---:|
 |![](https://i.imgur.com/62A6ThE.gif)|



## 👀 Diagram

### 🧬 UML
![은행창구 매니저 ClassDiagram](https://github.com/iOS-Woong/ios-bank-manager/blob/step2/UML.jpg?raw=true)

## ✅ 프로젝트 수행 핵심경험
 ### Step1
 Linked-list 자료구조의 이해 및 구현
 Queue 자료구조의 이해 및 구현
 Generics 개념이해 및 적용
 ### Step2
  Queue의 활용
 타입 추상화 및 일반화
 
## 기술적도전

### Queue, LinkedList, Node의 활용
* Node
    - 데이터를 저장해줄 data 변수 / 다음 데이터의 주소값을 저장해줄 next 변수로 구성하였습니다.
    - 다음 Node의 주소값을 저장하기 위해 struct대신 reference type인 class로 구현하였습니다.
    - data 프로퍼티는 외부에서 접근하여 읽기만 하기 때문에 private(set) 키워드를 추가했습니다.
    - Node 클래스는 더 이상 상속하지 않기때문에 class 앞에 final 키워드를 추가했습니다.
    ```swift
    final class Node<T> {
        private(set) var data: T?
        var next: Node<T>?

        init(data: T?, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    ```

* LinkedList
    - Node를 연결한 자료 구조형을 만들었습니다.
    - class로 구현해줄 마땅한 이유가 없어서 struct로 구현하였습니다.
    - 첫 노드를 가리키는 head와 마지막 노드를 가리키는 tail 프로퍼티를 만들었습니다.
    - head와 tail 프로퍼티에는 구현한 범위 밖에서 접근하지 못하도록 private 키워드를 추가했습니다.
    - 첫 노드의 값을 반환하는 firstValue 와 LinkedList가 비었는지 확인하는 isEmpty 연산 프로퍼티를 만들었습니다.
    - 끝에 노드를 추가하는 addLast(), 첫 번째 노드를 빼는 removeFirst(), 모든 노드를 지워주는 removeAll() 메서드를 만들었습니다.
    ```swift
    struct LinkedList<T> {
        private var head: Node<T>?
        private var tail: Node<T>?
        var headData: T? {
            return head?.data
        }
        var isEmpty: Bool {
            return head == nil
        }

        mutating func addLast(_ element: T) {
            let newNode: Node<T> = Node(data: element)
            guard let last = tail else {
                head = newNode
                tail = newNode
                return
            }
            last.next = newNode
            tail = newNode
        }

        mutating func removeFirst() -> T? {
            guard let first = head else {
                return nil
            }
            head = first.next
            tail = isEmpty ? nil : tail
            return first.data
        }

        mutating func removeAll() {
            head = nil
            tail = nil
        }
    }
    ```

* Queue
    - 요구사항에 따라 isEmpty, enqueue, dequeue, clear, peek을 구현하였습니다.
    - 다양한 데이터를 취급할 수 있도록 Generic 타입을 활용하였습니다.
    ```swift
    struct Queue<T> {
        private var linkedList: LinkedList<T> = LinkedList()
        var isEmpty: Bool {
            return linkedList.isEmpty
        }

        mutating func enqueue(_ element: T) {
            linkedList.addLast(element)
        }

        mutating func dequeue() -> T? {
            return linkedList.removeFirst()
        }

        mutating func clear() {
            linkedList.removeAll()
        }

        func peek() -> T? {
            return linkedList.headData
        }
    }
    ```

## 트러블슈팅

### UnitTest 관련 오류: TargetMembership 설정


- UnitTest 진행 시, sut를 정의해주면 아래 오류가 발생하였습니다.
    - 결론적으로 이 문제는 해결되었고, 문제의 원인으로는 테스트 코드와 관련된 모든 타입 파일(Node.swift, LinkedList.swift, Queue.swift)의 Target Membership을 지정해주지 않아 발생한 오류였습니다. (아래 그림 참조)
    > undefined symbol: nominal type descriptor for ...

    |수정 전|수정 후|
    |:---:|:---:|
    |![](https://i.imgur.com/xghtsQA.png)|![](https://i.imgur.com/ZbIAhiO.png)|


- Project와 Target의 차이
    |Project|Target|
    |:---|:---|
    |모든 파일, 리소스, 정보를 위한 저장소<br />프로젝트는 프로젝트 내 모든 타겟들을 포함하고 기본 빌드 설정을 정의|빌드 할 하나의 제품 및 프로젝트의 빌드 설정을 상속하고 오버라이드 할 수 있음<br />타겟을 빌드하기위해 다른 타겟이 필요하다면 의존을하고 있음<br />별도의 Info.plish가 존재<br />Target MemberShip을 반드시 체크해야 타겟끼리의 파일을 찾을 수 있음|

## 참고 링크
* [공식문서 - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
* [공식문서 - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
