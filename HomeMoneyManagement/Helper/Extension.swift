//
//  Extension.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 05/07/22.
//

import SwiftUI

extension View{
    func safeArea()->UIEdgeInsets{
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return .zero}
        guard let safeArea = window.windows.first?.safeAreaInsets else{return .zero}
        
        return safeArea
    }
}
