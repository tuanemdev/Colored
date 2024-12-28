import Foundation

public struct ANSIString: ExpressibleByStringInterpolation, StringInterpolationProtocol, CustomStringConvertible {
    public var content: String
    var codes: [any ANSICode]
    
    public init() {
        self.content = ""
        self.codes = []
    }
    
    public init(content: String, codes: [any ANSICode]) {
        self.content = content
        self.codes = codes
    }
    
    // MARK: - ExpressibleByStringInterpolation
    public init(stringLiteral value: String) {
        self.content = value
        self.codes = []
    }
    
    public init(stringInterpolation: Self) {
        self.content = stringInterpolation.content
        self.codes = stringInterpolation.codes
    }
    
    // MARK: - StringInterpolationProtocol
    public init(literalCapacity: Int, interpolationCount: Int) {
        self.content = ""
        self.codes = []
        content.reserveCapacity(interpolationCount)
    }
    
    mutating public func appendLiteral(_ literal: String) {
        content += literal
    }
    
    mutating public func appendInterpolation(_ newContent: Self) {
        let currentEscapeCode = codes.map(\.escapeCode).joined()
        self.content += (newContent.description + currentEscapeCode)
    }
    
    // MARK: - CustomStringConvertible
    public var description: String {
        codes.map(\.escapeCode).joined() + content + String.RESET
    }
}
