import UIKit

public struct ColorPalette {
	public static let primaryBackground: UIColor = UIColor.white
	public static let primaryText: UIColor = UIColor.bunker
	public static let primarySeparator: UIColor = UIColor.concrete
	
	public static let navigationBackground: UIColor = UIColor.eigengrau
	
	public static let noteBackground: UIColor = UIColor.hintOfRed
}

// MARK: - Private Colors
extension UIColor {
	convenience init(hexString: String) {
		let hex = hexString.replacingOccurrences(of: "#", with: "")
		guard hex.count == 6, let hexValue = Int(hex, radix: 16) else {
			self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
			return
		}
		self.init(red:   CGFloat( (hexValue & 0xFF0000) >> 16 ) / 255.0,
				  green: CGFloat( (hexValue & 0x00FF00) >> 8 ) / 255.0,
				  blue:  CGFloat( (hexValue & 0x0000FF) >> 0 ) / 255.0,
				  alpha: 1.0)
	}
}

private extension UIColor {
	
	static var eigengrau: UIColor {
		return UIColor(hexString: "#16161D")
	}
	
	static var bunker: UIColor {
		return UIColor(hexString: "#2D2D2D")
	}
	
	static var hintOfRed: UIColor {
		return UIColor(hexString: "#F9F9F9")
	}
	
	static var concrete: UIColor {
		return UIColor(hexString: "#D0D0D0")
	}
}
