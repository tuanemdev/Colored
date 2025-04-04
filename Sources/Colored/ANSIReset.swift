import Foundation

public struct ANSIReset: ANSICode {
    public var escapeCode: String {
        String.ESC + String.OPEN_SGR + String.DEFAULT + String.CLOSE_SGR
    }
}
