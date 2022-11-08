//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/03.
//

import Foundation

struct Banker {
    let number: Int
    let service: BankBusiness
    let oneMillion: Double = 1_000_000
    
    func processBankingBusiness(of customer: Customer) {
        let processingStartMessage: String = "\(number)번 \(customer.number)번 고객 \(service.description)업무 시작"
        print(processingStartMessage)
        usleep(UInt32(service.rawValue * oneMillion))
        let processingFinishMessage: String = "\(number)번 \(customer.number)번 고객 \(service.description)업무 완료"
        print(processingFinishMessage)
    }
}
