import Foundation

/**
 ESC: Escape
 SGR: Select Graphic Rendition
 */

extension String {
    static let RESET:           String = OPEN + DEFAULT + CLOSE_SGR
    static let OPEN:            String = ESC + OPEN_SGR
    
    static let ESC:             String = "\u{001B}"
    static let OPEN_SGR:        String = "["
    static let CLOSE_SGR:       String = "m"
    static let DEFAULT:         String = "0"
    
    static let EMPTY:           String = ""
}
