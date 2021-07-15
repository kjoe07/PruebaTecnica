//
//  AutenticatorManager.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
class AuthenticatorManager{
    static let shared = AuthenticatorManager()
    
    func authenticaApp() {
       // let auth = AzureAuth(method: .post, path: "/oauth/token", queryItems: nil, headers: ["Content-Type":"application/x-www-form-urlencoded"])
      //  auth.url.
       // let delegate = Delegate()
       // let session = URLSession(configuration: .default, delegate: delegate, delegateQueue:  .main)
        
        let dataLoader = NetworkLoader(session: URLSession.shared)
        let challengeService = RemoteDataService(loader: dataLoader)
        let qItems = [URLQueryItem(name: "operation", value: "getchallenge"),URLQueryItem(name: "username", value: "prueba")]
        let challengeEndpoint = HomeEndpoint(method: .get , path: "/datacrm/pruebatecnica/webservice.php", queryItems: qItems, headers: nil, params: nil)
        let challengeTask = challengeService.getData(endPoint: challengeEndpoint, completion: { (result: Result<GetChallengeResult,Error>) in
            switch result {
            case .success(let data):
                if !KeychainService.savePassword(service: "PTecnica", account: "token", data: data.result?.token ?? "") {
                    KeychainService.updatePassword(service: "PTecnica", account: "token", data: data.result?.token ?? "")
                }
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeResponse"), object: data)
            case .failure(let error):
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeFailed"), object: error)
            }
        })
        
//        let loader = NetworkLoader(session: URLSession.shared )
//        let params = ["username":"prueba","operation": "getchallenge"]
//        var res = URLRequest(url: URL(string: "https://develop.datacrm.la/datacrm/pruebatecnica/webservice.php")!) //try!
//        let jsonString = params.reduce("") { "\($0)\($1.0)=\($1.1)&" }.dropLast()
//        let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
//        res.httpBody = jsonData
//        res.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        res.httpMethod = Mehtod.post.rawValue
//        _ = loader.loadData(request:res , completion: {result in
//            switch result{
//            case .success(let data):
//                let val = try! JSONDecoder().decode(GetChallengeResult.self, from: data)
//                if !KeychainService.savePassword(service: "PTecnica", account: "token", data: val.result?.token ?? "") {
//                    KeychainService.updatePassword(service: "PTecnica", account: "token", data: val.result?.token ?? "")
//                }
//                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeResponse"), object: val)
//            case .failure(let e):
//                print(e.localizedDescription)
//                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeFailed"), object: e)
//               // completion(.failure(e))
//            }
//        })
    }
    
    
}
