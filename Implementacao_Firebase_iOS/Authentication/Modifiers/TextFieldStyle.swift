//
//  TextFieldStyle.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .background(.gray.mix(with: .white, by: 0.8))
            .foregroundColor(.gray)
            .clipShape(.rect(cornerRadius: 15))
            .padding(.horizontal)
    }
}

extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldStyle())
    }
}
