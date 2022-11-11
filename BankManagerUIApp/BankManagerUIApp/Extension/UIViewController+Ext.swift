//
//  UIViewController+Ext.swift
//  BankManagerUIApp
//
//  Created by 서현웅 on 2022/11/11.
//

import Foundation
import UIKit


#if DEBUG
import SwiftUI

extension UIViewController {
    
    private struct VCRepresentable: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
    }
    func getpreView() -> some View {
        VCRepresentable(viewController: self)
    }
}
#endif
