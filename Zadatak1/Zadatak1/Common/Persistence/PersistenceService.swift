import Foundation

class PersistenceService: PersistenceServiceProtocol {
    var homeModel: HomeModel? {
        get {
            UserDefaults.standard.load()
        }
        
        set {
            UserDefaults.standard.save(newValue!)
        }
    }
}
