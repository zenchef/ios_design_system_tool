import Foundation

final class DimensionParser {
    static func getJsonDimensions(from json: Data, completion: (Result<Data, Error>) -> Void) {
        do {
            var allDimensions: [DimensionEntity] = .init()
            let json = try JSONDecoder().decode(Dimensions.self, from: json)
            
            print(json.dimension)
            allDimensions = json.dimension.compactMap({ (key: String, value: Dimension) in
                return DimensionEntity(name: value.name, value: value.value)
            })
            do {
                completion(.success(try JSONEncoder().encode(allDimensions)))
            } catch {
                completion(.failure(error))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
