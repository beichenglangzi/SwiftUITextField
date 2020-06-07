//
//  BasicValidationError.swift
//  SwiftUITextField
//
//  Created by Nishith on 07/06/20.
//

import Foundation

public struct BasicValidationError: ValidationError {
    public var message: String
    public init(_ message: String) {
        self.message = message
    }
}
