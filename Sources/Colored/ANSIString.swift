import Foundation

public struct ANSIString: ExpressibleByStringInterpolation, StringInterpolationProtocol, CustomStringConvertible {
    public var content: String
    var codes: [ANSICode]
    
    // MARK: - ExpressibleByStringInterpolation
    public init() {
        self.content = ""
        self.codes = []
    }
    
    public init(content: String, codes: [ANSICode]) {
        self.content = content
        self.codes = codes
    }
    
    public init(stringLiteral value: String) {
        self.content = value
        self.codes = []
    }
    
    public init(stringInterpolation: Self) {
        self.content = stringInterpolation.description
        self.codes = []
    }
    
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
