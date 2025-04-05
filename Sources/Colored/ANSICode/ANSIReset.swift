import Foundation

// MARK: - ANSIReset
public struct ANSIReset: Sendable {
    private init() {}
    static let shared = ANSIReset()
}

// MARK: - ANSICode
extension ANSIReset: ANSICode {
    public var escapeCode: String {
        String.ESC + String.OPEN_SGR + String.DEFAULT + String.CLOSE_SGR
    }
}
