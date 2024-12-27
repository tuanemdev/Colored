import Foundation

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
