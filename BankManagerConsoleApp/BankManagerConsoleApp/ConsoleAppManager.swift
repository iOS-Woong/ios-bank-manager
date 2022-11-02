//
//  ConsoleAppManager.swift
//  BankManagerConsoleApp
//
//  Created by junho lee on 2022/11/02.
//

struct ConsoleAppManager {
    func startApp() {
        ConsoleAppMenu.printMenuList()
        let menu: ConsoleAppMenu = ConsoleAppMenu.inputMenu()
        switch menu {
        case .startBank:
            startBank()
            startApp()
        case .quit:
            return
        }
    }
    
    func startBank() {
        var bankManager: BankManager = BankManager()
        let customerNumber: Int = Int.random(in: 10...30)
        bankManager.addCustomers(count: customerNumber)
        bankManager.startBank()
    }
}
