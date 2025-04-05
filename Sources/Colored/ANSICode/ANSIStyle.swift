import Foundation

// MARK: - ANSIStyle
public enum ANSIStyle: Int {
    case bold           = 1
    case dim            = 2
    case italic         = 3
    case underline      = 4
    case blink          = 5
    case reverse        = 7
    case hidden         = 8
    
    var enStyle: Int {
        rawValue
    }
    
    var deStyle: Int {
        rawValue + 20
    }
}

// MARK: - ANSICode
extension ANSIStyle: ANSICode {
    public var escapeCode: String {
        String.ESC + String.OPEN_SGR + String(enStyle) + String.CLOSE_SGR
    }
}
