import Foundation
class User:Codable{
    // to fix error
    // what this class do right now ?
    // the privious one ?
}
// OSP that can i add function without modifing on other classes
protocol UserService {
    // class that have all information related and make one thing is relate with user
    // and maybe i have that more operation in the users like delete user or update
    func fetchUser(completion:@escaping (Result<[User],Error>)->Void)
    // maybe here is updateUser func
    // deleteUser
    // bansUser
}
// other thing is the Depandancy Inversion
// why ?? as network as i have a lot of ways i call the api or diffrance decoding ?
protocol NetworkManager{
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
// the code was duplicated if i try to catch other thing from the api
// so the session code that repeat i will put in the outter class
// as it this the way that i call the request function
class URLSessionNetworkManager: NetworkManager{
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1)))
                return
            }
            completion(.success(data))
            
        }.resume()
    }
}
// now i want to use the User how
//create a class that implement from the user service
class DefaultUserService: UserService{
    private let network: NetworkManager
    init(network:NetworkManager){
        self.network = network
    }
    func fetchUser(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "") else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1)))
            return
        }
        network.request(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
// the usage
// take the referance from the api
// and the user that i use it
//and use the fetch function in the uerservice
