import Foundation

/// Dimensions Service
final class DimensionsService {
    static func getDimensions() throws -> [DimensionDataModel] {
        guard let jsonData = FileManager.default.contents(atPath: K.themeDarkPath) else {
            throw DesignSystemError.jsonErrorFor(path: K.primitivePath)
        }
        let json = try JSONDecoder().decode(Dimensions.self, from: jsonData)
        var allDimensions = [DimensionEntity]()
        json.dimension.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.gap.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.padding.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.margin.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.width.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.radius.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.layout.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.size.forEach { dic in
            allDimensions.append(dic.value)
        }
        json.borderWidth.forEach { dic in
            allDimensions.append(dic.value)
        }
        return allDimensions.compactMap({
            DimensionDataModel(name: $0.name, value: $0.value)
        })
    }
}
