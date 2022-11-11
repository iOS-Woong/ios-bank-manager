//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRemoveButton()
    }

    func addRemoveButton() {
        let addButton: UIButton = UIButton()
        addButton.setTitle("고객 10명 추가", for: .normal)
        addButton.setTitleColor(.red, for: .normal)
        addButton.addTarget(self,
                            action: #selector(addView),
                            for: .touchUpInside)
        
        let removeButton: UIButton = UIButton()
        removeButton.setTitle("초기화", for: .normal)
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.addTarget(self,
                               action: #selector(removeView),
                               for: .touchUpInside)
    }
    
    @objc func addView() {
        
    }
    
    @objc func removeView() {
        
    }
    
    
    
    
    
}




