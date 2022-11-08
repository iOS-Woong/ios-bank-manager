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
    private var startTime: Date?
    private var endTime: Date?
    private var totalTime : String? {
        guard let startTime = startTime,
              let endTime = endTime else {
            return nil
        }
        return String(format: "%.2f", endTime.timeIntervalSince(startTime))
    }
    
    
    func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    func addBanker(_ banker: Banker) {
        switch banker.bankBusiness {
        case .deposit:
            depositBankerQueue.enqueue(banker)
        case .loan:
            loanBankerQueue.enqueue(banker)
        }
    }
    
    private func printClosingMessage() {
        guard let totalTime = totalTime else { return }
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(processingClosedMessage)
    }
    
    func startBankBusiness() {
        startTime = Date()
        let depositSemaphore: DispatchSemaphore = DispatchSemaphore(value: depositBankerQueue.count)
        let loanSemaphore: DispatchSemaphore = DispatchSemaphore(value: loanBankerQueue.count)
        let group: DispatchGroup = DispatchGroup()
        while customerQueue.isEmpty != true {
            guard let customer: Customer = customerQueue.dequeue() else { return }
            switch customer.bankBusiness {
            case .deposit:
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    guard let banker: Banker = self.depositBankerQueue.dequeue() else { return }
                    banker.processBankingBusiness(of: customer)
                    self.totalCustomerNumber += 1
                    self.depositBankerQueue.enqueue(banker)
                    depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    guard let banker: Banker = self.loanBankerQueue.dequeue() else { return }
                    banker.processBankingBusiness(of: customer)
                    self.totalCustomerNumber += 1
                    self.loanBankerQueue.enqueue(banker)
                    loanSemaphore.signal()
                }
            }
        }
        group.wait()
        endTime = Date()
        printClosingMessage()
    }
}
