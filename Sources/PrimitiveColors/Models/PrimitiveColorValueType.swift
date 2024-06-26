enum PrimitiveColorValueType: Codable {
    case color(PrimitiveColor)
    case other([String: PrimitiveColor])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let v = try? container.decode(PrimitiveColor.self) {
            self = .color(v)
            return
        } else if let v = try? container.decode([String: PrimitiveColor].self) {
            self = .other(v)
            return
        } else {
            fatalError("Impossible to parse due to an unknown type")
        }
        
        throw DecodingError.typeMismatch(
            PrimitiveColorValueType.self, DecodingError.Context(codingPath: decoder.codingPath,
                                  debugDescription: "Type is not matched",
                                  underlyingError: nil)
        )
    }
}
