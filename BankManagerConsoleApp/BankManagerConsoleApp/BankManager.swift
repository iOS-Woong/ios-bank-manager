//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {

    var 처리고객수 = 0
    var 소요시간 = 0.7
    
    mutating func 고객업무처리() {
        처리고객수 += 1
        소요시간 += 0.7
        print("\(처리고객수)번 고객 업무 시작")
        usleep(700000)
        print("\(처리고객수)번 고객 업무 완료")
    }
    
    func 업무마감() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(처리고객수)명이며, 총 업무시간은 \(round(소요시간))초입니다.")
    }
    
}
// 1111

/*
 대기중인 고객의 업무처리를 시작할 때 아래와 같이 출력합니다.
 “3번 고객 업무 시작”
 고객의 업무를 처리하면 아래와 같이 출력합니다.
 “5번 고객 업무 완료”
 */
