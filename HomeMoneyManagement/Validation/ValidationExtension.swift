////
////  ValidationExtension.swift
////  HomeMoneyManagement
////
////  Created by Bhumika Patel on 08/06/22.
////
//
//import SwiftUI
//class EmailValidationObj: ObservableObject {
//    @Published var email = "" {
//        didSet {
//            if self.email.isEmpty {
//                self.error = "Required"
//            } else if !self.email.validateEmail(){
//                self.error = "Invalid email"
//            } else {
//                self.error = ""
//            }
//        }
//    }
//    @ Published var error = ""
//}
//class PasswordValidationObj: ObservableObject{
//    @Published var pass = "" {
//        didSet{
//            self.isValidationPassword()
//        }
//    }
//    @Published var error = ""
//    
//    private func isValidationPassword(){
//        guard !self.pass.isEmpty else {
//            self.error = "Required"
//            return
//        }
//        let setPassError = self.pass.validatePassword() == false
//        if setPassError {
//            if self.pass.validateVeryfy() {
//                self.error = "Must be at list 8 Characters"
//                return
//            }
//            if !self.pass.upperCase() {
//                self.error = "Must be contain at least one uppercase"
//                return
//            }
//            if !self.pass.lowerCase() {
//                self.error = "Must be contain at least one LowerCase"
//                return
//                
//            }
//            if !self.pass.containsCharacter(){
//                self.error = "Must be contain at least one special character"
//                return
//            }
//            if !self.pass.containsDigit(){
//                self.error = "Must be contains at least one digit "
//                return
//            }
//        } else {
//            self.error = ""
//        }
//    }
//}
//
//extension String {
//    func validateEmail() -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//        return applyPredicateOnRegex(regexStr: emailRegEx)
//    }
//    func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
//        var passRegEx = ""
//        if mini >= max {
//            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
//        } else {
//            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
//        }
//        return applyPredicateOnRegex(regexStr: passRegEx)
//        
//    }
//    func upperCase() -> Bool {
//        let uppercaseRegex = ".*[A-Z]+.*"
//        return applyPredicateOnRegex(regexStr: uppercaseRegex)
//    }
//    func lowerCase() -> Bool {
//        let lowercaseRegex = ".*[a-z]+.*"
//        return applyPredicateOnRegex(regexStr: lowercaseRegex)
//    }
//    func containsCharacter() -> Bool {
//        let containscharRegex = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
//        return applyPredicateOnRegex(regexStr: containscharRegex)
//    }
//    func containsDigit() -> Bool {
//        let digitRegex = ".*[0-9]+.*"
//        return applyPredicateOnRegex(regexStr: digitRegex)
//    }
//    func applyPredicateOnRegex(regexStr: String) -> Bool {
//        let trimmedString = self.trimmingCharacters(in: .whitespaces)
//        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
//        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
//        return isValidateOtherString
//    }
//    
//    func validateVeryfy(mini: Int = 4, max: Int = 6) -> Bool {
////        var veryRegEx = ""
////        if mini == max {
////            veryRegEx = "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(mini),}$"
////        } else {
////            veryRegEx = "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(mini),\(max)}$"
////        }
//        return applyPredicateOnRegex(regexStr: "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(4),\(6)}$")
//        
//    }
//    
//}
