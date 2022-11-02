//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/02.
//

import Foundation

struct Bank {
    var 고객 = Customer()
    var 직원 = BankManager()
    
    mutating func 줄만들기() {
        고객.enqueueWaitingQueue()
    }
    
    mutating func 업무처리() {
        줄만들기()
        while 고객.waitingQueue.dequeue() != nil {
            직원.고객업무처리()
        }
        직원.업무마감()
    }
        
}

