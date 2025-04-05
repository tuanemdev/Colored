import Foundation

extension String: Colored {
    public func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self, codes: [color])
    }
    
    public func styled(_ styles: ANSIStyle...) -> ANSIString {
        ANSIString(content: self, codes: styles.reversed())
    }
}
