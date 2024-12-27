import Foundation

// MARK: - ANSIColor
public enum ANSIColor {
    case foreground(ColorType)
    case background(ColorType)
}

public enum ColorType {
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
        foreground + 1
    }
}

// MARK: - ANSICode
extension ANSIColor: ANSICode {
    public var escapeCode: String {
        switch self {
        case .foreground(let color):
            switch color {
            case .standard(color: let color, intensity: let intensity):
                "\(String.OPEN)\(intensity.foreground)\(color.rawValue)\(String.CLOSE_SGR)"
            case .extended(color: let color):
                "\(String.OPEN)38;5;\(color)\(String.CLOSE_SGR)"
            case .rgb(red: let red, green: let green, blue: let blue):
                "\(String.OPEN)38;2;\(red);\(green);\(blue)\(String.CLOSE_SGR)"
            }
        case .background(let color):
            switch color {
            case .standard(color: let color, intensity: let intensity):
                "\(String.OPEN)\(intensity.background)\(color.rawValue)\(String.CLOSE_SGR)"
            case .extended(color: let color):
                "\(String.OPEN)48;5;\(color)\(String.CLOSE_SGR)"
            case .rgb(red: let red, green: let green, blue: let blue):
                "\(String.OPEN)48;2;\(red);\(green);\(blue)\(String.CLOSE_SGR)"
            }
        }
    }
}
