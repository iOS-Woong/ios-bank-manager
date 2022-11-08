//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addRandomBuinsessCustomers(count: Int) {
        bank.addCustomerToQueue(Customer(number: 1, business: .loan))
        bank.addCustomerToQueue(Customer(number: 2, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 3, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 4, business: .loan))
        bank.addCustomerToQueue(Customer(number: 5, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 6, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 7, business: .loan))
        bank.addCustomerToQueue(Customer(number: 8, business: .loan))
        bank.addCustomerToQueue(Customer(number: 9, business: .loan))
        bank.addCustomerToQueue(Customer(number: 10, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 11, business: .loan))
        bank.addCustomerToQueue(Customer(number: 12, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 13, business: .deposit))
        bank.addCustomerToQueue(Customer(number: 14, business: .loan))
        
//        for customerNumber in 1...count {
//            if let business: BankBusiness = BankBusiness(rawValue: Int.random(in: 0...1)) {
//                let customer: Customer = Customer(number: customerNumber, business: business)
//                bank.addCustomerToQueue(customer)
//            }
//        }
    }
    
    mutating func addBankers(count: Int, business: BankBusiness) {
        for i in 1...count {
            let banker: Banker = Banker(number: i, business: business)
            bank.addBanker(banker)
        }
    }
    
    mutating func startBank() {
        bank.processBankingBusinessOfCustomers()
    }
}
