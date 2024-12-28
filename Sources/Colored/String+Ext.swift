import Foundation

extension String {
    static let RESET:           String = OPEN + DEFAULT + CLOSE_SGR
    static let OPEN:            String = ESC + OPEN_SGR
    
    /// Escape
    static let ESC:             String = "\u{001B}"
    /// Open Select Graphic Rendition
    static let OPEN_SGR:        String = "["
    /// Close Select Graphic Rendition
    static let CLOSE_SGR:       String = "m"
    /// Resets all formatting back to the terminal default
    static let DEFAULT:         String = "0"
    
    static let EMPTY:           String = ""
}
