//
//  SwiftUITextField.swift
//  Pods-SwiftUITextField_Example
//
//  Created by Nishith on 07/06/20.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ErrorTextField: View {
    var borderColor: Color
    var errorColor: Color
    var placeHolder: String
    var validColor: Color? = nil
    var keyboardType: UIKeyboardType
    var text: Binding<String>
    var onEditingChanged: () -> Void
    var onCommit: () -> Void
    var leftImage: Image?
    var isSecure: Bool
    var validationRules: ValidationRuleSet<String>? = nil
    var isInputValid: Binding<Bool>?
    var textContentType: UITextContentType
    @State private var error: Bool = false
    @State private var showValidColor: Bool = false
    @State private var errorMessage: String = ""

    public init(_ text: Binding<String>,isInputValid: Binding<Bool>? = nil, borderColor: Color = .gray, errorColor: Color = .red, placeHolder: String = "Text", keyboardType: UIKeyboardType = .default, onEditingChanged: @escaping () -> Void = { }, onCommit: @escaping () -> Void = {}, leftImage: Image? = nil, isSecure: Bool = false, validationRules: ValidationRuleSet<String>? = nil, validColor: Color? = nil, textContentType: UITextContentType = .name) {
        self.borderColor = borderColor
        self.errorColor = errorColor
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        self.text = text
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
        self.leftImage = leftImage
        self.isSecure = isSecure
        self.validationRules = validationRules
        self.validColor = validColor
        self.isInputValid = isInputValid
        self.textContentType = textContentType
    }

    public var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                if leftImage != nil {
                    leftImage!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(.leading, 8)

                }
                ValidatorTextField(placeHolder: placeHolder, isSecure: isSecure, didEndEditing: onTextFieldCommit, text: text, keyboardType: keyboardType, onTextChange: onTextChanged, textContentType: textContentType)
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(error ? errorColor : showValidColor ? validColor! : borderColor, lineWidth: 0.3))
            .frame(maxHeight: 55)
            if !errorMessage.isEmpty && error {
                Text(errorMessage)
                    .lineLimit(nil)
                    .foregroundColor(errorColor)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
            }
        }
    }

    func onTextChanged(text: String) {
        if let rules = validationRules, !text.isEmpty {
            let result = Validator.validate(input: text, rules: rules)
            switch result {
            case .valid:
                isInputValid?.wrappedValue = true
            case .invalid(_):
                isInputValid?.wrappedValue = false
            }
        }
        error = false
        showValidColor = false
        onEditingChanged()
    }

    func onTextFieldCommit() {
        if let rules = validationRules, !text.wrappedValue.isEmpty {
            let result = Validator.validate(input: text.wrappedValue, rules: rules)
            switch result {
            case .valid:
                error = false
                if self.validColor != nil {
                    showValidColor = true
                }
            case .invalid(let error):
                if let message = error.first?.message{
                    self.errorMessage = message
                }
                self.error = true
            }
        }

        onCommit()
    }
}
