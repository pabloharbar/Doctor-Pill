//
//  FocusableTextField.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import SwiftUI

struct FocusableTextField: UIViewRepresentable {
    @Binding var isFirstResponder: Bool
    @Binding var text: String
    let label: String

    var onCommit: () -> Void = {}

    public init(_ label: String, text: Binding<String>, isFirstResponder: Binding<Bool>, onCommit: @escaping () -> Void = {}) {
        self.label = label
        self._text = text
        self._isFirstResponder = isFirstResponder
        self.onCommit = onCommit
    }

    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        textField.placeholder = label
        
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textViewDidChange), for: .editingChanged)
        textField.keyboardType = .default

        textField.delegate = context.coordinator
        
        return textField
    }

    public func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }

        if isFirstResponder {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator($text, isFirstResponder: $isFirstResponder, onCommit: onCommit)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFirstResponder: Bool
        var onCommit: () -> Void

        init(_ text: Binding<String>, isFirstResponder: Binding<Bool>, onCommit: @escaping () -> Void) {
            self._text = text
            self._isFirstResponder = isFirstResponder
            self.onCommit = onCommit
        }

        @objc public func textViewDidChange(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFirstResponder = true
            }
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFirstResponder = false
            }
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            onCommit()
            return false
        }
    }
}

struct FocusableTextField_Previews: PreviewProvider {
    static var previews: some View {
        FocusableTextField("Placeholder", text: .constant(""), isFirstResponder: .constant(true))
            .frame(height: 30)
            .padding()
    }
}
