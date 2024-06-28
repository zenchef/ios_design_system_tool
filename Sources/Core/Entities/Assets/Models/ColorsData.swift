struct ColorsData: Codable {
    let colors: [ColorEntry]
    let info: ColorAssetInfo
    
    init(lightColorComponents: ColorComponents, darkColorComponent: ColorComponents) {
        self.colors = [
            ColorEntry(
                color: ColorEntry.Color(
                    colorSpace: "rgb",
                    components: lightColorComponents
                ),
                idiom: "universal",
                appearances: nil
            ),
            ColorEntry(
                color: ColorEntry.Color(
                    colorSpace: "rgb",
                    components: darkColorComponent
                ),
                idiom: "universal",
                appearances: [
                    Appearance(appearance: "luminosity", value: "dark")
                ]
            )
        ]
        self.info = ColorAssetInfo()
    }
}
