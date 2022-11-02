//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho lee on 2022/11/02.
//

import Foundation

struct Bank {
    private let processingTimePerCustomer: Double = 0.7
    private var customerQueue: Queue<Customer> = Queue()
    private var processedCustomersNumber: Int = 0
    private var bankerNumber: Int = 1
    private var totalProcessingTime: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        let unformatted: Double = Double(processedCustomersNumber) * processingTimePerCustomer
        return numberFormatter.string(from: NSNumber(value: unformatted)) ?? ""
    }

    mutating func addCustomerToCustomerQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func processCustomersInQueue() {
        while customerQueue.isEmpty == false {
            for _ in 1...bankerNumber {
                guard customerQueue.isEmpty == false else {
                    break
                }
                processCustomer()
            }
        }
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomersNumber)명이며, 총 업무시간은 \(totalProcessingTime)초입니다."
        print(processingClosedMessage)
    }
    
    private mutating func processCustomer() {
        guard let customer = customerQueue.dequeue() else {
            return
        }
        let processingStartMessage: String = "\(customer.number)번 고객 업무 시작"
        print(processingStartMessage)
        self.processedCustomersNumber += 1
        let processingFinishMessage: String = "\(customer.number)번 고객 업무 완료"
        print(processingFinishMessage)
    }
}
