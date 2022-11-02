//
//  ConsoleAppMenu.swift
//  BankManagerConsoleApp
//
//  Created by junho lee on 2022/11/02.
//

enum ConsoleAppMenu: Int, CaseIterable {
    case startBank = 1
    case quit = 2
    
    var description: String {
        switch self {
        case .startBank:
            return "은행개점"
        case .quit:
            return "종료"
        }
    }
    
    static func printMenuList() {
        for menu in ConsoleAppMenu.allCases {
            let menuInfo: String = "\(menu.rawValue) : \(menu.description)"
            print(menuInfo)
        }
    }
    
    static func inputMenu() -> ConsoleAppMenu {
        print("입력 : ", terminator: "")
        guard let input: Int = Int(readLine() ?? ""),
              let inputMenu: ConsoleAppMenu = ConsoleAppMenu(rawValue: input) else {
            print("다시 입력하세요.")
            return inputMenu()
        }
        return inputMenu
    }
}
