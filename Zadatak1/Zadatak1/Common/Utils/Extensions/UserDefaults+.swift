import Foundation

extension UserDefaults {
    func load() -> HomeModel? {
        let key = "homeModel"
        guard let data = self.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(HomeModel.self, from: data)
    }
    
    func save(_ homeModel: HomeModel) {
        guard let data = try? JSONEncoder().encode(homeModel) else { return }
        let key = "homeModel"
        self.set(data, forKey: key)
    }
}
