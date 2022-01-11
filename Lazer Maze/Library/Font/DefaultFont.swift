struct DefaultFont {
	enum Weight: String {
		case light = "Light"
		case regular = "Regular"
		case medium = "Medium"
		case semibold = "SemiBold"
		case bold = "Bold"
	}
	
	static func name(weight: Weight) -> String {
		"Rajdhani-\(weight.rawValue)"
	}
}
