//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addCustomers(count: Int) {
        for customerNumber in 1...count {
            guard let bankBusiness: BankBusiness = BankBusiness.allCases.randomElement() else { return }
            let customer: Customer = Customer(number: customerNumber, bankBusiness: bankBusiness)
            bank.addCustomerToQueue(customer)
        }
    }
    
    mutating func addBankers(bankBusiness: BankBusiness, count: Int) {
        for banker in Array.init(repeating: Banker(bankBusiness: bankBusiness), count: count) {
            bank.addBanker(banker)
        }
    }
    
    mutating func startBank() {
        bank.startBankBusiness()
    }
    
    mutating func reset() {
        bank = Bank()
    }
}
