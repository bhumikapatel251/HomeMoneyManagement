//
//  LoginScreenModel.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 28/05/22.
//

import SwiftUI

class LoginScreenModel: ObservableObject {
    // Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var LoginScreen: Bool = false
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    //log status.
    @AppStorage("log_Status") var log_Status: Bool = false
    //Login call
    func Login(){
        if(registerUser){
            // register validation
            // register api
            print("register api")
            
        } else {
            // login validation
            // login api
            print("login api")
        }
        
        // action
        withAnimation{
            log_Status = true
            //print("login api")
        }
    }
    
    func Register(){
       
        // action
        withAnimation{
            log_Status = true
            print("register api")
        }
    }
    
    func ForgotPassword(){
       //action
    }
}
