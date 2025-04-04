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
    case black      = 0
    case red        = 1
    case green      = 2
    case yellow     = 3
    case blue       = 4
    case magenta    = 5
    case cyan       = 6
    case white      = 7
}

public enum StandardIntensity {
    case standard
    case bright
}

public enum ColorPosition {
    case foreground
    case background
    
    func prefix(for colorType: ColorType) -> String {
        switch (self, colorType) {
        case (.foreground, .standard(_, let intensity)):
            switch intensity {
            case .standard:
                "3"
            case .bright:
                "4"
            }
        case (.background, .standard(_, let intensity)):
            switch intensity {
            case .standard:
                "9"
            case .bright:
                "10"
            }
        case (.foreground, .extended):
            "38;5;"
        case (.background, .extended):
            "38;2;"
        case (.foreground, .rgb):
            "48;5;"
        case (.background, .rgb):
            "48;2;"
        }
    }
}

// MARK: - ANSICode
extension ANSIColor: ANSICode {
    public var escapeCode: String {
        String.ESC +
        String.OPEN_SGR +
        position.prefix(for: colorType) +
        styleCode +
        String.CLOSE_SGR
    }
    
    var position: ColorPosition {
        switch self {
        case .foreground:
                .foreground
        case .background:
                .background
        }
    }
    
    var colorType: ColorType {
        switch self {
        case .foreground(let colorType), .background(let colorType):
            colorType
        }
    }
    
    var styleCode: String {
        switch colorType {
        case .standard(let color, _):
            "\(color.rawValue)"
        case .extended(let color):
            "\(color)"
        case .rgb(let red, let green, let blue):
            "\(red);\(green);\(blue)"
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
