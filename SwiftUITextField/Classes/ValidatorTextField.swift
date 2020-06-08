//
//  ValidatorTextField.swift
//  SwiftUITextField
//
//  Created by Nishith on 07/06/20.
//

import SwiftUI
import UIKit

class ValidatorTextFieldCoordinator: NSObject, UITextFieldDelegate {

    var onTextChange: (String) -> ()
    var didEndEditing: () -> ()

    init(onTextChange: @escaping (String) -> (), didEndEditing: @escaping () -> ()) {
        self.onTextChange = onTextChange
        self.didEndEditing = didEndEditing
        super.init()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if let text = textField.text,
        let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            onTextChange(updatedText)
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didEndEditing()
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing()
    }
}


@available(iOS 13.0, *)
struct ValidatorTextField: UIViewRepresentable {

    var placeHolder: String
    var isSecure: Bool
    var didEndEditing: () -> () = {}
    var text: Binding<String>
    var keyboardType: UIKeyboardType
    var onTextChange: (String) -> () = {(_) in }
    var textContentType: UITextContentType = .name
    var autocapitalizationType: UITextAutocapitalizationType = .sentences
    @State private var maxWidth: CGFloat = 0


    func makeCoordinator() -> ValidatorTextFieldCoordinator {
        return ValidatorTextFieldCoordinator(onTextChange: { (text) in
            self.text.wrappedValue = text
            self.onTextChange(text)
        }, didEndEditing: didEndEditing)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.isSecureTextEntry = isSecure
        textField.keyboardType = keyboardType
        textField.borderStyle = .none
        textField.placeholder = placeHolder
        textField.textContentType = textContentType
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.autocapitalizationType = autocapitalizationType
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) { }
}
