//
//  AuthenticationView.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationLink {
            SignInEmailView(showSignInView: $showSignInView)
        } label: {
            Text("Sign in with email")
                .singInButtonStyle()
        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(true))
    }
}
