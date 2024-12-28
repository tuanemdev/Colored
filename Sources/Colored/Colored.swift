import Foundation

public extension String {
    // MARK: - Color
    func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self, codes: [color])
    }
    
    // MARK: - Effect
    func effects(_ effects: ANSIEffect...) -> ANSIString {
        ANSIString(content: self, codes: effects)
    }
}

public extension ANSIString {
    // MARK: - Color
    func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self.content, codes: self.codes + [color])
    }
    
    // MARK: - Effect
    func effects(_ effects: ANSIEffect...) -> ANSIString {
        ANSIString(content: self.content, codes: self.codes + effects)
    }
}
