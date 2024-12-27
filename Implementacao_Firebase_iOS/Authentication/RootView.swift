//
//  RootView.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

struct RootView: View {
    @State var showSignInView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }.onAppear {
                let authUser = try? AutheticationManager.shared.getAutheticatedUser()
                showSignInView = authUser == nil
            }
            .fullScreenCover(isPresented: $showSignInView) {
                NavigationStack {
                    AuthenticationView(showSignInView: $showSignInView)
                }
            }
        }
    }
}

#Preview {
    RootView()
}
