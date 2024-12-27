import Foundation

public extension String {
    // MARK: - Color
    func foreground(_ color: ANSIColor) -> String {
        switch color {
        case .standard(color: let color, intensity: let intensity):
            "\(String.escape)[\(intensity.foreground)\(color.rawValue)m\(self)\(String.escape)[0m"
        case .extended(color: let color):
            "\(String.escape)[38;5;\(color)m\(self)\(String.escape)[0m"
        case .rgb(red: let red, green: let green, blue: let blue):
            "\(String.escape)[38;2;\(red);\(green);\(blue)m\(self)\(String.escape)[0m"
        }
    }
    
    func background(_ color: ANSIColor) -> String {
        switch color {
        case .standard(color: let color, intensity: let intensity):
            "\(String.escape)[\(intensity.background)\(color.rawValue)m\(self)\(String.escape)[0m"
        case .extended(color: let color):
            "\(String.escape)[48;5;\(color)m\(self)\(String.escape)[0m"
        case .rgb(red: let red, green: let green, blue: let blue):
            "\(String.escape)[48;2;\(red);\(green);\(blue)m\(self)\(String.escape)[0m"
        }
    }
    
    // MARK: - Effect
    func effects(_ effects: ANSIEffect...) -> String {
        let start: String = effects.map { "\(String.escape)[\($0.onEffect)" }.joined()
        let end: String = effects.map { "\(String.escape)[\($0.offEffect)" }.joined()
        return "\(start)\(self)\(end)"
    }
}
