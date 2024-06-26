struct ColorAsset: Codable {
    var color: ColorInfo
    var idiom: String
    
    init(color: ColorInfo) {
        self.color = color
        self.idiom = "universal"
    }
}
