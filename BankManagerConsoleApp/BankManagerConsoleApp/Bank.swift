//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

class Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var depositBankers: Queue<Banker> = Queue()
    private var loanBankers: Queue<Banker> = Queue()
    private var processedCustomerNumber: Int = 0
    private var startTime: Date?
    private var endTime: Date?
    private var totalTime: String? {
        guard let startTime, let endTime else { return nil }
        let totalTime: Double = endTime.timeIntervalSince(startTime)
        return String(format: "%.2f", totalTime)
    }
    
    func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    func addBanker(_ banker: Banker) {
        switch banker.business {
        case .deposit:
            depositBankers.enqueue(banker)
        case .loan:
            loanBankers.enqueue(banker)
        }
    }
    
    private func printClosingMessage() {
        if let totalTime {
            let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomerNumber)명이며, 총 업무시간은 \(totalTime)초입니다."
            print(processingClosedMessage)
        }
    }
    
    func processBankingBusinessOfCustomers() {
        startTime = Date()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let group = DispatchGroup()
        while self.customerQueue.isEmpty == false {
            guard let customer = self.customerQueue.dequeue() else { break }
            switch customer.business {
            case .deposit:
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    if let banker = self.depositBankers.dequeue() {
                        banker.processBankingBusiness(of: customer)
                        self.processedCustomerNumber += 1
                        self.depositBankers.enqueue(banker)
                    }
                    depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    if let banker = self.loanBankers.dequeue() {
                        banker.processBankingBusiness(of: customer)
                        self.processedCustomerNumber += 1
                        self.loanBankers.enqueue(banker)
                    }
                    loanSemaphore.signal()
                }
            }
        }
        group.wait()
        endTime = Date()
        self.printClosingMessage()
    }
}
