//
//  AuthenticationView.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationLink {
            SignInEmailView()
        } label: {
            Text("Sign in with email")
                .singInButtonStyle()
        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
