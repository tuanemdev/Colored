import Foundation

extension ANSIString: Colored {
    public func colored(_ color: ANSIColor) -> ANSIString {
        ANSIString(content: self.content, codes: [color] + self.codes)
    }
    
    public func styled(_ styles: ANSIStyle...) -> ANSIString {
        ANSIString(content: self.content, codes: styles.reversed() + self.codes)
    }
}
