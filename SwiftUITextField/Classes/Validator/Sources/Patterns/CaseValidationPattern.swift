import Foundation

public enum CaseValidationPattern: String, ValidationPattern {
    
    case uppercase, lowercase, password_8char_special_upper
    
    public var pattern: String {
        switch self {
        case .uppercase:return "^.*?[A-Z].*?$"
        case .lowercase:return "^.*?[a-z].*?$"
        case .password_8char_special_upper: return "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        }
    }
}
