extension Level {
	convenience init(fromDescription description: String) throws {
		var cells = description
			.split(separator: "\n")
			.map { $0.split(separator: " ").map(String.init) }
		
		var lazer: Lazer?
		var exit: Exit?
		
		var missingData: Bool {
			lazer == nil || exit == nil
		}
		
		let top = cells[0]
		
		if
			missingData,
			top.contains("~~"),
			let x = top.firstIndex(where: Lazer.items.contains)
		{
			switch top[x] {
			case #"^^"#:
				exit = .init(at: .vertical(.up, at: x))
			case #"vv"#:
				lazer = .init(at: .vertical(.up, at: x), to: .vertical(.down))
			case #"//"#:
				lazer = .init(at: .vertical(.up, at: x), to: .diagonal(.down, .left))
			case #"\\"#:
				lazer = .init(at: .vertical(.up, at: x), to: .diagonal(.down, .right))
			default:
				throw Description.Error.invalid(withReason: "Invalid lazer or exit")
			}
			
			cells.remove(at: 0)
		}
		
		let bottom = cells[cells.count - 1]
		
		if
			missingData,
			bottom.contains("~~"),
			let x = bottom.firstIndex(where: Lazer.items.contains)
		{
			switch bottom[x] {
			case #"^^"#:
				lazer = .init(at: .vertical(.down, at: x), to: .vertical(.up))
			case #"vv"#:
				exit = .init(at: .vertical(.down, at: x))
			case #"//"#:
				lazer = .init(at: .vertical(.down, at: x), to: .diagonal(.up, .right))
			case #"\\"#:
				lazer = .init(at: .vertical(.down, at: x), to: .diagonal(.up, .left))
			default:
				throw Description.Error.invalid(withReason: "Invalid lazer or exit")
			}
			
			cells.remove(at: cells.count - 1)
		}
		
		let left = cells.map { $0[0] }
		
		if
			missingData,
			left.contains("~~"),
			let y = left.firstIndex(where: Lazer.items.contains)
		{
			switch left[y] {
			case #"<<"#:
				exit = .init(at: .horizontal(.left, at: y))
			case #">>"#:
				lazer = .init(at: .horizontal(.left, at: y), to: .horizontal(.right))
			case #"//"#:
				lazer = .init(at: .horizontal(.left, at: y), to: .diagonal(.up, .right))
			case #"\\"#:
				lazer = .init(at: .horizontal(.left, at: y), to: .diagonal(.down, .left))
			default:
				throw Description.Error.invalid(withReason: "Invalid lazer or exit")
			}
			
			for (index, var row) in cells.enumerated() {
				row.remove(at: 0)
				cells[index] = row
			}
		}
		
		let right = cells.map { $0[$0.count - 1] }
		
		if
			missingData,
			right.contains("~~"),
			let y = right.firstIndex(where: Lazer.items.contains)
		{
			switch right[y] {
			case #"<<"#:
				lazer = .init(at: .horizontal(.right, at: y), to: .horizontal(.left))
			case #">>"#:
				exit = .init(at: .horizontal(.right, at: y))
			case #"//"#:
				lazer = .init(at: .horizontal(.right, at: y), to: .diagonal(.down, .left))
			case #"\\"#:
				lazer = .init(at: .horizontal(.right, at: y), to: .diagonal(.up, .left))
			default:
				throw Description.Error.invalid(withReason: "Invalid lazer or exit")
			}
			
			for (index, var row) in cells.enumerated() {
				row.remove(at: row.count - 1)
				cells[index] = row
			}
		}
		
		guard let lazer = lazer, let exit = exit else {
			throw Description.Error.invalid(withReason: "Missing lazer or exit")
		}
		
		self.init(
			withCells: try cells.map { row throws in
				try row.map { string throws in
					guard let cell = Self.cell(from: string) else {
						throw Description.Error.invalid(withReason: "Unknown item \"\(string)\"")
					}
					
					return cell
				}
			},
			lazer: lazer,
			exit: exit
		)
	}
	
	fileprivate static func cell(from string: String) -> Cell? {
		if string == "xx" {
			return .init(as: .empty, hasStar: true)
		}
		
		let hasStar = string.starts(with: "xx")
		let item = hasStar ? .init(string.dropFirst(2)) : string
		
		func piece(to direction: Direction, double: Bool = false) -> Cell {
			.init(as: .piece(.init(to: direction, double: double)), hasStar: hasStar)
		}
		
		switch item {
		case #"-^"#:
			return piece(to: .vertical(.up))
		case #"-v"#:
			return piece(to: .vertical(.down))
		case #"--"#:
			return piece(to: .vertical(.up), double: true)
		case #"<|"#:
			return piece(to: .horizontal(.left))
		case #"|>"#:
			return piece(to: .horizontal(.right))
		case #"||"#:
			return piece(to: .horizontal(.left), double: true)
		case #"\>"#:
			return piece(to: .diagonal(.up, .right))
		case #"<\"#:
			return piece(to: .diagonal(.down, .left))
		case #"\\"#:
			return piece(to: .diagonal(.up, .right), double: true)
		case #"</"#:
			return piece(to: .diagonal(.up, .left))
		case #"/>"#:
			return piece(to: .diagonal(.down, .right))
		case #"//"#:
			return piece(to: .diagonal(.up, .left), double: true)
		case #"::"#:
			return .init(as: .empty, hasStar: hasStar)
		case #"[]"#:
			return .init(as: .block, hasStar: hasStar)
		default:
			return nil
		}
	}
}
