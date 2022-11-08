//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

struct Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var depositBankerQueue: Queue<Banker> = Queue()
    private var loanBankerQueue: Queue<Banker> = Queue()
    private var totalCustomerNumber: Int = 0
    private var totalTime: Double = 0
    private var formattedProcessedTotalTime: String {
        return String(format: "%.2f", totalTime)
    }
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ banker: Banker) {
        switch banker.bankBusiness {
        case .deposit:
            depositBankerQueue.enqueue(banker)
        case .loan:
            loanBankerQueue.enqueue(banker)
        }
    }
    
    private mutating func printClosingMessage() {
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
    
    mutating func startBankBusiness() {
        while customerQueue.isEmpty != true {
            guard let customer: Customer = customerQueue.dequeue() else { return }
            switch customer.bankBusiness {
            case .deposit:
                guard let banker: Banker = depositBankerQueue.dequeue() else { return }
                banker.processBankingBusiness(of: customer)
                totalCustomerNumber += 1
                totalTime += BankBusiness.deposit.processingTimePerCustomer
                depositBankerQueue.enqueue(banker)
            case .loan:
                guard let banker: Banker = loanBankerQueue.dequeue() else { return }
                banker.processBankingBusiness(of: customer)
                totalCustomerNumber += 1
                totalTime += BankBusiness.loan.processingTimePerCustomer
                loanBankerQueue.enqueue(banker)
            }
        }
        printClosingMessage()
    }
}
