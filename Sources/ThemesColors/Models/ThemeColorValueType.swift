enum ThemeColorValueType: Codable {
    case themeColor(ThemeColor)
    case other1([String: ThemeColor])
    case other2([String: [String: ThemeColor]])
    
    var colors: [ThemeColor] {
        switch self {
        case .themeColor(let themeColor):
            return [themeColor]
        case .other1(let dictionary):
            return Array(dictionary.values)
        case .other2(let dictionary):
            var arr = [ThemeColor]()
            dictionary.forEach({ arr.append(contentsOf: Array($0.value.values)) })
            return arr
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let v = try? container.decode(ThemeColor.self) {
            self = .themeColor(v)
            return
        } else if let v = try? container.decode([String: ThemeColor].self) {
            self = .other1(v)
            return
        } else if let v = try? container.decode([String: [String: ThemeColor]].self) {
            self = .other2(v)
            return
        }
        throw DecodingError.typeMismatch(
            ThemeColorValueType.self, DecodingError.Context(codingPath: decoder.codingPath,
                                  debugDescription: "Type is not matched",
                                  underlyingError: nil)
        )
    }
}
