import Foundation

// MARK: - ANSIEffect
public enum ANSIEffect: Int {
    case bold = 1
    case dim
    case italic
    case underline
    case blinkSlow
    case blinkRapid
    case reverse
    case hidden
    case strikethrough
    
    var onEffect: Int {
        rawValue
    }
    
    var offEffect: Int {
        rawValue + 20
    }
}

// MARK: - ANSICode
extension ANSIEffect: ANSICode {
    public var escapeCode: String {
        String.ESC + String.OPEN_SGR + String(onEffect) + String.CLOSE_SGR
    }
}
