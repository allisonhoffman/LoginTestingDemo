//
//  ContentView.swift
//  LoginTestingDemo
//
//  Created by Allison Hoffman on 3/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login Testing Demo")
                    .foregroundColor(.teal)
                    .font(.title)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 50, trailing: 15))
                    .accessibilityIdentifier("ContentView_title_text")
                
                HStack(spacing: 15) {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 7))
                        .accessibilityIdentifier("ContentView_personIcon_image")
                    TextField("email", text: $email)
                        .keyboardType(.emailAddress)
                        .accessibilityIdentifier("ContentView_email_textField")
                }
                .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1))
                .foregroundColor(.gray)
                .padding(.horizontal, 15)
                
                HStack{
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .accessibilityIdentifier("ContentView_lockIcon_image")
                    SecureField("password", text: $password)
                        .keyboardType(.namePhonePad)
                        .accessibilityIdentifier("ContentView_password_secureTextField")
                }
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal,15)
                    .foregroundColor(.gray)
                    .padding(.top, 25)
                
                if !email.isEmpty || !password.isEmpty {
                    if !email.isEmpty {
                        if !self.isEmailValid(email) {
                            Text("Invalid email format.")
                                .accessibilityIdentifier("ContentView_invalidEmail_staticText")
                        }
                    }
                    if !password.isEmpty {
                        if !self.isPasswordValid(password) {
                            Text("Invalid password format.")
                                .accessibilityIdentifier("ContentView_invalidPassword_staticText")
                        }
                    }
                }
                
                Spacer()
    
                NavigationLink(destination: LoginView(), label: {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .accessibilityIdentifier("ContentView_login_button")
                })
                    .background(
                        Color.teal
                    )
                    .cornerRadius(8)
                    .offset(y: -40)
                    .padding(.bottom, -40)
                
                Spacer()
                
            }
            .padding(.top, 100)
            .padding(.leading)
            .padding(.trailing)
        }
        
        Spacer()
    }
    
    
    func isEmailValid(_ email: String?) -> Bool {
        guard let email = email,
              !email.isEmpty else {
                return false
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]{1,}\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    
    func isPasswordValid(_ password: String?) -> Bool {
        guard let password = password,
              !password.isEmpty else {
                return false
        }
        let passWordRegex = "^[a-zA-Z0-9]{6,20}+$"
        let passWordPredicate = NSPredicate(format: "SELF MATCHES%@", passWordRegex)
        return passWordPredicate.evaluate(with: password)
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(email: "", password: "")
    }
}
