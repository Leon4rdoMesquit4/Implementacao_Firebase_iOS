//
//  SingInButtonStyle.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI

struct SingInButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.pink)
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .clipShape(.rect(cornerRadius: 15))
            .padding(.horizontal)
    }
}

extension View {
    func singInButtonStyle() -> some View {
        modifier(SingInButtonStyle())
    }
}
