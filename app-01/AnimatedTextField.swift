//
//  AnimatedTextField.swift
//  app-01
//
//  Created by Ramiro Uziel Rodriguez Pineda on 08/09/24.
//

import SwiftUI

struct AnimatedTextField: View {
    @Binding var text: String
    let placeholder: String
    var lineLimit: Int? = nil
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(placeholder)
                .foregroundColor(text.isEmpty ? Color(.placeholderText) : .accentColor)
                .offset(y: text.isEmpty ? 5 : -5)
                .scaleEffect(text.isEmpty ? 1 : 0.8, anchor: .topLeading)
            
            TextField("", text: $text, axis: .vertical)
                .offset(y: text.isEmpty ? 0 : 10)
                .lineLimit(lineLimit)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.top, 5)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: text)
        .padding(.bottom, 5)
        .padding(.vertical, 5)
    }
}
