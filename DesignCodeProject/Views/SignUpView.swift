//
//  SignUpView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 09.05.2024.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle).bold()
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
            TextField("Email", text: $email)
                .inputStyle(icon: "mail")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled(true)
            SecureField("Password", text: $password)
                .textContentType(.password)
                .inputStyle(icon: "lock")
            Button {} label: {
                Text("Create an account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            // button style
            .buttonStyle(.angular)
            // button color
            .tint(.accentColor)
            // button size
            .controlSize(.large)
            
            Group {
                Text("By clicking on ")
                + Text("_Create an account_").foregroundStyle(.primary.opacity(0.7))
                + Text(", you agree to our **Terms of Service** and **[Privacy Policy](https://designcode.io)**")
                
                Divider()
                
                HStack {
                    Text ("Already have an account?")
                    Button {} label: {
                        Text("**Sign in**")
                    }
                }
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
            .tint(.secondary)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        .padding(20)
        .background(
            Image("Blob 1").offset(x: 200, y: -100)
        )
    }
}

#Preview {
    SignUpView()
}
