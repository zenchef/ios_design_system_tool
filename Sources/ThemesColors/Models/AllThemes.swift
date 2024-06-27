struct AllThemes: Decodable {
    var background: [String: ThemeColorValueType]
    var content: [String: ThemeColorValueType]
    var border: [String: ThemeColorValueType]
    var focusRing: [String: ThemeColorValueType]
    var shadow: [String: ThemeColorValueType]
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case background = "background"
        case content = "content"
        case border = "border"
        case focusRing = "focus-ring"
        case shadow = "shadow"
    }
}
