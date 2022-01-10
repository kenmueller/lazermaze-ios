import Foundation

extension Level.Description {
	enum Error: LocalizedError {
		case invalid(withReason: String)
		
		var errorDescription: String? {
			switch self {
			case let .invalid(reason):
				return reason
			}
		}
	}
}
