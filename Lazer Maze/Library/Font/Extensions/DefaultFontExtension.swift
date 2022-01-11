import SwiftUI

extension Font {
	static func `default`(size: CGFloat, weight: DefaultFont.Weight) -> Self {
		.init(UIFont.default(size: size, weight: weight))
	}
}
