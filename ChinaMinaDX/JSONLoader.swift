import Foundation

class JSONLoader {
    static func load() -> [String: [[String: String]]] {
        guard let url = Bundle.main.url(forResource: "PPD_database_export", withExtension: "json") else {
            print("❌ Could not find JSON file in bundle")
            return [:]
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([String: [[String: String]]].self, from: data)
            print("✅ JSON loaded successfully")
            return decoded
        } catch {
            print("❌ Failed to decode JSON:", error)
            return [:]
        }
    }
}
