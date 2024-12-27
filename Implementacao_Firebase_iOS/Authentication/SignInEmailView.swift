//
//  SignInEmailView.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email/Password founded!")
            return
        }
        try await AutheticationManager.shared.createUser(
            email: email,
            password: password
        )
    }
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email/Password founded!")
            return
        }
        try await AutheticationManager.shared.signInUser(
            email: email,
            password: password
        )
    }
}

struct SignInEmailView: View {
    @StateObject var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email...", text: $viewModel.email)
                .textFieldStyle()
            TextField("Password...", text: $viewModel.password)
                .textFieldStyle()
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign in with email")
                    .singInButtonStyle()
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(true))
    }
}
