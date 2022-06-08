//
//  LoginScreen.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 28/05/22.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var loginData: LoginScreenModel = LoginScreenModel()
    @ObservedObject var emailObj = EmailValidationObj()
    @ObservedObject var passObj = PasswordValidationObj()
    
    
   // @State var nativeAlert = false
    @State var customAlert = false
    @State var show: Bool = false
   // @State var HUD = false
    @State var email = ""
    var body: some View {
       // NavigationView{
        VStack{
            // three half screen
                Text("Welcome\nback")
                    .font(.custom(customFont, size: 45).bold())
            
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 7.5)
                    .padding()
                    .background(
                        
                        ZStack{
                            //Gradient Circle
                            LinearGradient(colors: [
                                Color("G4")
                                .opacity(0.8),
                                Color("purple"),
                            ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                            
                            Circle()
                                .strokeBorder(Color.purple.opacity(0.3),lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 2 )
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                            Circle()
                                .strokeBorder(Color.purple.opacity(0.3),lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading,30)
                            
                        }
                    )
 
                    
            ScrollView(.vertical,showsIndicators: false){
                
                //Login screen form
                VStack(spacing: 15) {
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //custom textfield
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "admin@gmail.com", value: $emailObj.email, showPassword: .constant(false))
                    Text(emailObj.error).foregroundColor(.red)
                        .padding(.top,30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $passObj.pass, showPassword:$loginData.showPassword)
                    Text(passObj.error).foregroundColor(.red)
                        .padding(.top,10)
                    
                   //register reenter password
                    if loginData.registerUser{
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "1234546", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                    }
                    // forgot password button
                    Button{
                        loginData.ForgotPassword()
                       // alertView()
                        show.toggle()
                    } label: {
                        Text(loginData.registerUser ? "" : "Forgot Password")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("G4"))
                        
                        
                    }
                    .sheet(isPresented: $show){
                        VStack(alignment: .leading){
                            Text("Forgot Password")
                                .font(.custom(customFont, size: 22).bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                            CustomTextField(icon: "envelope", title: "Email", hint: "admin@gmail.com", value: $loginData.email, showPassword: .constant(false))
                                .padding(.top,60)
                            Button{
                                
                            } label: {
                                Text("Send")
                                    .font(.custom(customFont, size: 17).bold())
                                    .padding(.vertical,20)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .background{
                                        LinearGradient(colors: [
                                            Color("G4"),
                                            Color("G5"),
                                            Color("G5"),
                                            Color("G4"),
                                        ], startPoint: .top, endPoint: .bottom)
                                        .ignoresSafeArea()
                                    }
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                                
                                
                            }
                            .padding(.top,25)
                        }
                        .padding(.vertical,60)
                        .padding(.horizontal)
                        
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Login button
                    Button{
                        loginData.Login()
                    } label: {
                        Text(loginData.registerUser ? "Create" : "Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background{
                                LinearGradient(colors: [
                                    Color("G4"),
                                    Color("G5"),
                                    Color("G5"),
                                    Color("G4"),
                                ], startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                            }
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        
                        
                    }
                    .padding(.top,25)
                    .padding(.horizontal)
                    //.frame(maxWidth: .infinity, alignment: .leading)
                    
                    // register user button
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to Login" : "Create Account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("G4"))
                        
                        
                    }
                    
                    
                    .padding(.top, 8)
                    //.frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(30)
            }
            .frame(maxWidth:.infinity , maxHeight: .infinity)
            .background(
                Color.white
                // apply custom corner
                    .clipShape(CustomCorner(corner: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
            
        }
        //.navigationBarHidden(true)
        .frame(maxWidth:.infinity , maxHeight: .infinity)
        .background{
            LinearGradient(colors: [
                Color("G4"),
                Color("G5"),
                Color("G5"),
                Color("G4"),
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        }
        
        //clearing data when changes.
        //optional
        .onChange(of: loginData.registerUser){ newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
            
          //  }
        
        }
    }
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)->some View{
        VStack(alignment: .leading, spacing: 12){
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
            
        }
        // showing show button for password field
        .overlay(
            
            Group{
                
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("G4"))
                    })
                  .offset(y: 8)
                   
               }
                    
         }
                    ,alignment: .trailing
        )
    }
//    func alertView(){
//        let alert = UIAlertController(title: "Forgot Password", message: "Enter Your Email", preferredStyle: .alert)
//        alert.addTextField{ (email) in
//            email.placeholder = "Enter your email"
//            email.returnKeyType = .next
//            email.keyboardType = .emailAddress
//        }
//        // Action
//        let forgotPassword = UIAlertAction(title: "Send", style: .default) { (_) in
//            //yor code
//            email = alert.textFields![0].text!
//        }
//        let cancel = UIAlertAction(title: "Cancel", style: .destructive){ (_) in
//            //saME
//        }
//        //adding into alertview
//        alert.addAction(cancel)
//        alert.addAction(forgotPassword)
//        //presenting alertView
//
//        UIApplication.shared.windows.first?.rootViewController?.present(alert,animated: true, completion: {
//            // your code
//        })
//    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}


class EmailValidationObj: ObservableObject {
    @Published var email = "" {
        didSet {
            if self.email.isEmpty {
                self.error = "Required"
            } else if !self.email.validateEmail(){
                self.error = "Invalid email"
            } else {
                self.error = ""
            }
        }
    }
    @ Published var error = ""
}
class PasswordValidationObj: ObservableObject{
    @Published var pass = "" {
        didSet{
            self.isValidationPassword()
        }
    }
    @Published var error = ""
    
    private func isValidationPassword(){
        guard !self.pass.isEmpty else {
            self.error = "Required"
            return
        }
        let setPassError = self.pass.validatePassword() == false
        if setPassError {
            if self.pass.count < 6 {
                self.error = "Must be at list 6 Characters"
                return
            }
            if !self.pass.upperCase() {
                self.error = "Must be contain at least one uppercase"
                return
            }
            if !self.pass.lowerCase() {
                self.error = "Must be contain at least one LowerCase"
                return
                
            }
            if !self.pass.containsCharacter(){
                self.error = "Must be contain at least one special character"
                return
            }
            if !self.pass.containsDigit(){
                self.error = "Must be contains at least one digit "
                return
            }
        } else {
            self.error = ""
        }
    }
}

extension String {
    func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    func validatePassword() -> Bool {
        let passRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<]{6,}$"
        return applyPredicateOnRegex(regexStr: passRegEx)
        
    }
    func upperCase() -> Bool {
        let uppercaseRegex = ".*[A-Z]+.*"
        return applyPredicateOnRegex(regexStr: uppercaseRegex)
    }
    func lowerCase() -> Bool {
        let lowercaseRegex = ".*[a-z]+.*"
        return applyPredicateOnRegex(regexStr: lowercaseRegex)
    }
    func containsCharacter() -> Bool {
        let containscharRegex = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
        return applyPredicateOnRegex(regexStr: containscharRegex)
    }
    func containsDigit() -> Bool {
        let digitRegex = ".*[0-9]+.*"
        return applyPredicateOnRegex(regexStr: digitRegex)
    }
    func applyPredicateOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
    
    func validateVeryfy(mini: Int = 4, max: Int = 6) -> Bool {
//        var veryRegEx = ""
//        if mini == max {
//            veryRegEx = "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(mini),}$"
//        } else {
//            veryRegEx = "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(mini),\(max)}$"
//        }
        return applyPredicateOnRegex(regexStr: "^(?=.*[0-9])(?=.*\\d)[0-9\\d]{\(4),\(6)}$")
        
    }
    
}
