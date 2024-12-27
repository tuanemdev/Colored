import Foundation

public extension ANSIString {
    // MARK: - Color
    func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self.content, codes: [color])
    }
    
    // MARK: - Effect
    func effects(_ effects: ANSIEffect...) -> ANSIString {
        ANSIString(content: self.content, codes: effects)
    }
}
