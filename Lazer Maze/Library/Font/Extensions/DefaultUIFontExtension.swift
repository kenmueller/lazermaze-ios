import UIKit

extension UIFont {
	static func `default`(size: CGFloat, weight: DefaultFont.Weight) -> Self {
		let name = DefaultFont.name(weight: weight)
		
		guard let font = Self(name: name, size: size) else {
			fatalError("Unable to load \(name)")
		}
		
		return font
	}
}
