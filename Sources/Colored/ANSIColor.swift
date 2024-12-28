import Foundation

// MARK: - ANSIColor
public enum ANSIColor {
    case foreground(ColorType)
    case background(ColorType)
}

public enum ColorType {
    /// Standard 16 Colors
    case standard(color: StandardColor, intensity: StandardIntensity = .standard)
    /// Extended 256 Colors (8-bit color)
    case extended(color: UInt8)
    /// RGB Colors (24-bit color)
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

// MARK: - Init ColorType
public extension ColorType {
    static var black:          Self { .standard(color: .black, intensity: .standard) }
    static var red:            Self { .standard(color: .red, intensity: .standard) }
    static var green:          Self { .standard(color: .green, intensity: .standard) }
    static var yellow:         Self { .standard(color: .yellow, intensity: .standard) }
    static var blue:           Self { .standard(color: .blue, intensity: .standard) }
    static var magenta:        Self { .standard(color: .magenta, intensity: .standard) }
    static var cyan:           Self { .standard(color: .cyan, intensity: .standard) }
    static var white:          Self { .standard(color: .white, intensity: .standard) }
    
    static var lightBlack:     Self { .standard(color: .black, intensity: .bright) }
    static var lightRed:       Self { .standard(color: .red, intensity: .bright) }
    static var lightGreen:     Self { .standard(color: .green, intensity: .bright) }
    static var lightYellow:    Self { .standard(color: .yellow, intensity: .bright) }
    static var lightBlue:      Self { .standard(color: .blue, intensity: .bright) }
    static var lightMagenta:   Self { .standard(color: .magenta, intensity: .bright) }
    static var lightCyan:      Self { .standard(color: .cyan, intensity: .bright) }
    static var lightWhite:     Self { .standard(color: .white, intensity: .bright) }
}
