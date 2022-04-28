import Foundation

protocol PersistenceServiceProtocol: AnyObject {
    var homeModel: HomeModel? { get set }
}
