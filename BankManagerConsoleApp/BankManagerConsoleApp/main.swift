//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



func start() {
    printOption()
}

func printOption() {
    print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
    let input = readLine()
    
    switch input {
    case "1":
        var a = Bank()
        a.업무처리()
        printOption()
    default:
        return
    }
    
}

start()
