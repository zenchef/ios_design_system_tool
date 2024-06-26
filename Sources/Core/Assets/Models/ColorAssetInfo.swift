struct ColorAssetInfo: Codable {
    var auhtor: String
    var version: Int
    
    init() {
        self.auhtor = "xcode"
        self.version  = 1
    }
}
