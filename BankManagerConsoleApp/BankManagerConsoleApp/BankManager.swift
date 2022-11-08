//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addCustomers(count: Int) {
        for customerNumber in 1...count {
            guard let randomBankBusiness: BankBusiness = BankBusiness.allCases.randomElement() else { return }
            let customer: Customer = Customer(number: customerNumber, wantService: randomBankBusiness)
            bank.addCustomerToQueue(customer)
        }
    }
    
    mutating func addBankers(bankBusiness: BankBusiness, count: Int) {
        for i in 0...count {
            let banker: Banker = Banker(number: i, service: bankBusiness)
            bank.addBanker(banker)
        }
    }
    
    mutating func startBank() {
        bank.비동기startBankBusiness()
    }
    
    mutating func reset() {
        bank = Bank()
    }
}
