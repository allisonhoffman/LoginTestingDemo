//
//  LoginView.swift
//  LoginTestingDemo
//
//  Created by Allison Hoffman on 3/20/23.
//

import SwiftUI

struct LoginView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemTeal]
    }
    
    var body: some View {
        NavigationView {
            Text("Login!")
                .accessibilityIdentifier("LoginView_title_text")
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
