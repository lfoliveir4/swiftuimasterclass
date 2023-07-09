import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file)")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) on bundle")
        }

        guard let response = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return response
    }
}
