import Foundation

extension FileManager {
    static func cleanFolder(for path: String, completion: @escaping () -> Void) {
        do {
            try self.default.removeItem(atPath: path)
            completion()
        } catch {
            print("Error deleting file: \(error)")
        }
    }
}
