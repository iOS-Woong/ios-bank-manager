//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/02.
//

import Foundation

struct Customer {
    var waitingQueue = Queue<Int>()
    
    mutating func enqueueWaitingQueue() {
        let numberOfCustomer = Int.random(in: 10...30)
        
        for i in 1...numberOfCustomer {
            waitingQueue.enqueue(i)
        }
    }
}






//은행에는 n명의 고객이 업무처리를 위해 대기합니다.
//고객의 대기열은 Step 1에서 구현한 Queue 타입을 활용합니다.
