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
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email/Password founded!")
            return
        }
        Task {
            do {
                let returnedUserData = try await AutheticationManager.shared.createUser(
                    email: email,
                    password: password
                )
                print("Auth success: \(returnedUserData)")
            } catch {
                print(error)
            }
        }
    }
}

struct SignInEmailView: View {
    @StateObject var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email...", text: $viewModel.email)
                .textFieldStyle()
            TextField("Password...", text: $viewModel.password)
                .textFieldStyle()
            Button {
                viewModel.signIn()
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
        SignInEmailView()
    }
}
