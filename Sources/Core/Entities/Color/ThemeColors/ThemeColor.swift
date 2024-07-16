struct ThemeColor: Codable {
    var name: String
    var hexa: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case hexa = "value"
    }
}
