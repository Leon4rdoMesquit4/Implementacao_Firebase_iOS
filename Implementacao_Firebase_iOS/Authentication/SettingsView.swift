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
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(true))
    }
}
