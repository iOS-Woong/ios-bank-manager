//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addCustomers(count: Int) {
        for number in 1...count {
            let customer: Customer = Customer(number: number)
            bank.addCustomerToCustomerQueue(customer)
        }
    }
    
    mutating func startBank() {
        bank.processCustomersInQueue()
    }
}
