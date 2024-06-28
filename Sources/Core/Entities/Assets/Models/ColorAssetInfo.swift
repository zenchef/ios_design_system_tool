struct ColorAssetInfo: Codable {
    var author: String
    var version: Int
    
    init() {
        self.author = "xcode"
        self.version  = 1
    }
}
