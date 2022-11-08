//
//  BankBusiness.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/08.
//

import Foundation

enum BankBusiness: Double, CaseIterable {
    case deposit = 0.7
    case loan = 1.1
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
}
