//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addRandomBuinsessCustomers(count: Int) {
        for customerNumber in 1...count {
            if let business: BankBusiness = BankBusiness(rawValue: Int.random(in: 0...1)) {
                let customer: Customer = Customer(number: customerNumber, business: business)
                bank.addCustomerToQueue(customer)
            }
        }
    }
    
    mutating func addBankers(count: Int, business: BankBusiness) {
        for _ in 1...count {
            let banker: Banker = Banker(business: business)
            bank.addBanker(banker)
        }
    }
    
    mutating func startBank() {
        bank.processBankingBusinessOfCustomers()
    }
}
