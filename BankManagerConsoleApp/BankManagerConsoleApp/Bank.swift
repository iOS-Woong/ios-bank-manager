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
    private var bankers: [Banker] = []
    private var processedCustomerNumber: Int = 0
    private var processedTotalTime: Double = 0
    
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
        bankers.append(banker)
    }
    
    private func printClosingMessage() {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        guard let formattedProcessedTotalTime: String = numberFormatter.string(from: NSNumber(value: processedTotalTime)) else {
            return
        }
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomerNumber)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
    
    func processBankingBusinessOfCustomers() {
        let pickDepositBankerQueue = DispatchQueue(label: "PickDepositBankerQueue")
        let pickLoanBankerQueue = DispatchQueue(label: "PickLoanBankerQueue")
        let group = DispatchGroup()
        while self.customerQueue.isEmpty == false {
            guard let customer = self.customerQueue.dequeue() else { break }
            DispatchQueue.global().async(group: group) {
                switch customer.business {
                case .deposit:
                    pickDepositBankerQueue.sync {
                        if let banker = self.depositBankers.dequeue() {
                            banker.processBankingBusiness(of: customer)
                            self.depositBankers.enqueue(banker)
                            self.processedCustomerNumber += 1
                            self.processedTotalTime += banker.business.processingTimePerCustomer
                        }
                    }
                case .loan:
                    pickLoanBankerQueue.sync {
                        if let banker = self.loanBankers.dequeue() {
                            banker.processBankingBusiness(of: customer)
                            self.loanBankers.enqueue(banker)
                            self.processedCustomerNumber += 1
                            self.processedTotalTime += banker.business.processingTimePerCustomer
                        }
                    }
                }
            }
            group.wait()
            self.printClosingMessage()
        }
    }
}
