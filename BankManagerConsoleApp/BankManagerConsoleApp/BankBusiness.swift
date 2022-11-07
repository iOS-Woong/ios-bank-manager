//
//  BankBusiness.swift
//  BankManagerConsoleApp
//
//  Created by junho lee on 2022/11/06.
//

enum BankBusiness: Int {
    case deposit
    case loan
    
    var processingTimePerCustomer: Double {
        switch self {
        case .deposit:
            return 1.1
        case .loan:
            return 0.7
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "대출"
        case .loan:
            return "예금"
        }
    }
}
