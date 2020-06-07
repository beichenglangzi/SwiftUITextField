//
//  ContentView.swift
//  SwiftUITextField_Example
//
//  Created by Nishith on 07/06/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftUITextField

struct ContentView: View {

    @State var emailText: String = ""
    @State var passwordText: String = ""
    let emailRule = ValidationRuleSet(rules: [ValidationRulePattern(pattern: EmailValidationPattern.standard, error: BasicValidationError("Invalid email"))])

    var passwordRule = ValidationRuleSet<String>(rules: [ValidationRulePattern(pattern: CaseValidationPattern.password_8char_special_upper, error: BasicValidationError("Please enter a password more then 8 characters and containing atleast one number, uppercase letter and special"))])
    @State var isEmailValid: Bool = false
    @State var isPasswordValid: Bool = false


    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ErrorTextField(self.$emailText,
                                   isInputValid: self.$isEmailValid,
                                   errorColor: .red,
                                   placeHolder: "Email",
                                   leftImage: Image(uiImage: UIImage(named: "email")!),
                                   validationRules: self.emailRule,
                                   validColor: .green)
                    ErrorTextField(self.$passwordText,
                                   isInputValid: self.$isPasswordValid,
                                   errorColor: .red,
                                   placeHolder: "Password",
                                   leftImage: Image(uiImage: UIImage(named: "lock")!),
                                   isSecure: true,
                                   validationRules: self.passwordRule,
                                   validColor: .green)
                    Button(action:{}) {
                        Text("Login")
                    }
                    .padding(.top, 54)
                    .disabled(!self.isEmailValid || !self.isPasswordValid)
                }
            }
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
            .navigationBarTitle("SwiftUITextField", displayMode: .large)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
