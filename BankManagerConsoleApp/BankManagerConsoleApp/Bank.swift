//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

class Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var depositBankerQueue: Queue<Banker> = Queue()
    private var loanBankerQueue: Queue<Banker> = Queue()
    private var totalCustomerNumber: Int = 0
    private var totalTime: Double = 0
    private var formattedProcessedTotalTime: String {
        return String(format: "%.2f", totalTime)
    }
    
    func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    func addBanker(_ banker: Banker) {
        switch banker.service {
        case .deposit:
            depositBankerQueue.enqueue(banker)
        case .loan:
            loanBankerQueue.enqueue(banker)
        }
    }
    
    private func printClosingMessage() {
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
    
//    mutating func startBankBusiness() {
//        while customerQueue.isEmpty == false {
//            for banker in bankers {
//                guard let customer = customerQueue.dequeue() else {
//                    break
//                }
//                banker.processBankingBusiness(of: customer)
//                self.totalCustomerNumber += 1
//                self.totalTime += banker.service.rawValue
//            }
//        }
//        printClosingMessage()
//    }
    
    // 첫번째 뱅커 꺼내서
    func 비동기startBankBusiness() {
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        
        while customerQueue.isEmpty != true {
            guard let customer = customerQueue.dequeue() else { return }
            switch customer.wantService {
            case .deposit:
                
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    if let banker = self.depositBankerQueue.dequeue() {
                        banker.processBankingBusiness(of: customer)
                        self.totalCustomerNumber += 1
                        self.depositBankerQueue.enqueue(banker)
                    }
                    depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    if let banker = self.loanBankerQueue.dequeue() {
                        banker.processBankingBusiness(of: customer)
                        self.totalCustomerNumber += 1
                        self.loanBankerQueue.enqueue(banker)
                    }
                }
                loanSemaphore.signal()
            }
        }
        group.wait()
        printClosingMessage()
    }
}
