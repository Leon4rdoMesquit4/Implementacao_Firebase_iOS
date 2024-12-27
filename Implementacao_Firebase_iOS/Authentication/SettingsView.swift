//
//  SettingsView.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    func logout() throws {
        try AutheticationManager.shared.logOut()
    }
    func resetPassword() async throws {
        let authUser = try AutheticationManager.shared.getAutheticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AutheticationManager.shared.resetPassword(email: email)
    }
    func updateEmail(email: String) async throws {
        try await AutheticationManager.shared.updateEmail(email: email)
    }
    func updatePassword(password: String) async throws {
        try await AutheticationManager.shared.updatePassword(password: password)
    }
}

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        List {
            Button("Logout") {
                Task {
                    do {
                        try viewModel.logout()
                        showSignInView = true
                    } catch {
                        print("Sign out failed with error: \(error)")
                    }
                }
            }
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password reset!")
                    } catch {
                        print("Sign out failed with error: \(error)")
                    }
                }
            }
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password reset!")
                    } catch {
                        print("Sign out failed with error: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(true))
    }
}
