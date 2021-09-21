//
//  ListTextField.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 14/09/21.
//

import SwiftUI

struct ListTextField: View {
    let label: String
    @Binding var text: String
    @State var showTextField = false
    var onFocus: () -> Void = {}
    
    func clearText() {
        if text.isEmpty {
            showTextField = false
            UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true) // Hide default keyboard if open
        } else {
            text = ""
        }
    }

    var body: some View {
        ZStack {
            HStack {
                Text(label)

                Spacer()
                
                Button(action: {
                    self.showTextField = true
                    onFocus()
                }) {
                    HStack(spacing: 11) {
                        Text(text)
                        
                        Image(systemName: "chevron.right")
                            .font(.footnote.weight(.semibold))
                    }
                    .foregroundColor(.primary.opacity(0.6))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .contentShape(Rectangle())
            .zIndex(0)
            .offset(x: showTextField ? -UIScreen.main.bounds.width : 0)

            HStack(spacing: 2) {
                FocusableTextField(label, text: $text, isFirstResponder: $showTextField, onCommit: {
                    self.showTextField = false
                })

                Button(action: clearText) {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(Color(UIColor.placeholderText))
            }
            .contentShape(Rectangle())
            .zIndex(10)
            .offset(x: showTextField ? 0 : UIScreen.main.bounds.width)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            self.showTextField = true
            onFocus()
        }
        .animation(.default)
        .font(.body)
    }
}

struct ListTextField_Previews: PreviewProvider {
    static var previews: some View {
        ListTextField(label: "Nome", text: .constant("Paracetamol"))
    }
}
