import Foundation

public protocol Colored {
    func colored(_ color: ANSIColor) -> ANSIString
    func styled(_ styles: ANSIStyle...) -> ANSIString
}
