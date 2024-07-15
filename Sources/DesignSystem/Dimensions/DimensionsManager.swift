/// Dimensions manager
final class DimensionsManager: DesignElement {
    func generate() {
        do {
            let dimensions = try DimensionsService.getDimensions()
            guard !dimensions.isEmpty else {
                print("Dimensions file creation has been stopped because dimensions is empty")
                return
            }
            DimensionFileGenerator.generate(from: dimensions, at: K.dimensionsPath)
        } catch {
            if let error = error as? DesignSystemError {
                print(error.description)
            } else {
                print(error.localizedDescription)
            }
        }
    }
}
