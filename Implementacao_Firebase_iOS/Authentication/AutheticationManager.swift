//
//  AutheticationManager.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AutheticationManager {
    static let shared = AutheticationManager()
    private init() {}
    func getAutheticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let emailWithoutBlankSpace = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let authDataResult = try await Auth.auth().createUser(withEmail: emailWithoutBlankSpace, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let emailWithoutBlankSpace = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let authDataResult = try await Auth.auth().signIn(withEmail: emailWithoutBlankSpace, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    func logOut() throws {
        try Auth.auth().signOut()
    }
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.sendEmailVerification(beforeUpdatingEmail: email)
    }
}
