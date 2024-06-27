import ArgumentParser

@main
struct DesignSystemTool: ParsableCommand {
    @Argument(help: "Path where the asset catalog will be generated")
    var assetPath: String
    
//    @Argument(help: "Path of the source json colors")
//    var jsonColorPath: String
//    
    public func run() throws {
        if let primitiveColors = try? ThemesColorsService.getColors(),
           let themeColors = try? PrimitiveColorService.getColors() {
            print((primitiveColors + themeColors).count)
            ColorAssetsGenerator.generate(
                from: primitiveColors + themeColors,
                at: assetPath
            )
        }
    }
}

