import Foundation
import SwiftUI

struct URLTextField: UIViewRepresentable {
    @Binding var urlString: String

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $urlString)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "URL"

        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .URL
        
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ view: UITextField, context: Context) {
        view.text = urlString
    }
}

extension URLTextField {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
    }
}


struct URLTextField_Previews: PreviewProvider {
    static var previews: some View {
        URLTextField(urlString: .constant(""))
            .frame(height: 30)
            .padding()
    }
}
