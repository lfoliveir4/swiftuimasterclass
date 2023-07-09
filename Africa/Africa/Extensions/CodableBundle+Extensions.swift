import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) to bundle")
        }

        guard let response = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("failed to decode \(file) to bundle")
        }

        return response
    }
}
