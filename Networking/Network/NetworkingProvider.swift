import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let baseUrl = "https://randomuser.me/api"
    private let kStatusOk = 200...299
    
    func getUser(id: Int, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        AF.request(baseUrl, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self) {  response in
            
            if let user = response.value?.results![0] {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
}
