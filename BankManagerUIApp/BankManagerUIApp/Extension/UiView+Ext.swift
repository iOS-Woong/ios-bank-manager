//
//  UiView+Ext.swift
//  BankManagerUIApp
//
//  Created by 서현웅 on 2022/11/11.
//

import Foundation
import UIKit


#if DEBUG
import SwiftUI

extension UIView {
    
    private struct ViewRepresentable: UIViewRepresentable {
          
        let uiView: UIView
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        
        func makeUIView(context: Context) -> some UIView {
            return uiView
        }
    }
    func getpreView() -> some View {
        ViewRepresentable(uiView: self)
    }
}


#endif
