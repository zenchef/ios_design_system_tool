struct FocusRingColors: Codable {
    var focusRing: ThemeColorValueType
    
    enum CodingKeys: String, CodingKey {
        case focusRing = "focus-ring"
    }
}
