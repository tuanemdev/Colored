import Foundation

public protocol Colored {
    func colored(_ color: ANSIColor) -> ANSIString
    func effects(_ effects: ANSIEffect...) -> ANSIString
    
    func foreground(_ color: ColorType) -> ANSIString
    func background(_ color: ColorType) -> ANSIString
}

// MARK: - Colored
public extension Colored {
    func foreground(_ color: ColorType) -> ANSIString {
        colored(.foreground(color))
    }
    
    func background(_ color: ColorType) -> ANSIString {
        colored(.background(color))
    }
}

// MARK: - String + Colored
extension String: Colored {
    public func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self, codes: [color])
    }
    
    public func effects(_ effects: ANSIEffect...) -> ANSIString {
        ANSIString(content: self, codes: effects.reversed())
    }
}

// MARK: - ANSIString + Colored
extension ANSIString: Colored {
    public func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self.content, codes: [color] + self.codes)
    }
    
    public func effects(_ effects: ANSIEffect...) -> ANSIString {
        ANSIString(content: self.content, codes: effects.reversed() + self.codes)
    }
}
