import Foundation

public enum ANSIColor {
    /// Standard 16 Colors
    case standard(color: StandardColor, intensity: StandardIntensity = .standard)
    /// Extended 256 Colors
    case extended(color: UInt8)
    /// RGB Colors
    case rgb(red: UInt8, green: UInt8, blue: UInt8)
}

public enum StandardColor: Int {
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white
}

public enum StandardIntensity {
    case standard
    case bright
    
    var foreground: Int {
        switch self {
        case .standard: 3
        case .bright:   9
        }
    }
    
    var background: Int {
        switch self {
        case .standard: 4
        case .bright:   10
        }
    }
}
