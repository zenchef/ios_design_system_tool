final class ColorsManager: DesignElement {
    func generate() {
        do {
            let primitiveColors = try ThemesColorsService.getColors()
            let themeColors = try PrimitiveColorService.getColors()
            ColorAssetsGenerator.generate(from: primitiveColors + themeColors, at: K.assetPath)
            print("🚀 \((primitiveColors + themeColors).count) have been generated with success")
        } catch {
            if let error = error as? DesignSystemError {
                print(error.description)
            } else {
                print(error.localizedDescription)
            }
        }
    }
}
