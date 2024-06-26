struct ColorsAsset: Codable {
    var colors: [ColorAsset]
    var info: ColorAssetInfo
    
    init(colorComponents: ColorComponents) {
        self.colors = [ColorAsset(color: ColorInfo(colorSpace: "rgb", colorComponents: colorComponents))]
        self.info = ColorAssetInfo()
    }
}
