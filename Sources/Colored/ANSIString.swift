import Foundation

public struct ANSIString: ExpressibleByStringInterpolation, StringInterpolationProtocol, CustomStringConvertible {
    var content: String
    var codes: [any ANSICode]
    
    public init() {
        self.content = String.EMPTY
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
        self.content = String.EMPTY
        self.codes = []
        self.content.reserveCapacity(interpolationCount)
    }
    
    mutating public func appendLiteral(_ literal: String) {
        self.content += literal
    }
    
    mutating public func appendInterpolation(_ newContent: Self) {
        self.content += newContent.description
    }
    
    // MARK: - CustomStringConvertible
    public var description: String {
        let escapeCode = codes.map(\.escapeCode).joined()
        let components = self.content.components(separatedBy: String.RESET)
        
        var result = escapeCode
        components.enumerated().forEach { index, content in
            result += content + String.RESET
            let isNeedRepeatEscapeCode = index < (components.count - 1)
            result += isNeedRepeatEscapeCode ? escapeCode : String.EMPTY
        }
        
        return result
    }
}
