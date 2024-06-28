struct PrimitiveColors: Codable {
    var color: [String: PrimitiveColorValueType]
    
    enum CodingKeys: String, CodingKey {
        case color = "color"
    }
}
