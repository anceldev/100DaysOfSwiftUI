//
//  FormSample.swift
//  CupCakeCorner
//
//  Created by Ancel Dev account on 14/11/23.
//

import SwiftUI

struct FormSample: View {
    @State private var username = ""
    @State private var email = ""
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
    }
}

#Preview {
    FormSample()
}
