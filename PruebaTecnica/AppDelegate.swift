//
//  AppDelegate.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var challengeTask: NetworkCancelable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let dataLoader = NetworkLoader(session: URLSession.shared)
        let challengeService = RemoteDataService(loader: dataLoader)
        let qItems = [URLQueryItem(name: "operation", value: "getchallenge"),URLQueryItem(name: "username", value: "prueba")]
        let challengeEndpoint = HomeEndpoint(method: .get , path: "datacrm/pruebatecnica/webservice.php", queryItems: qItems, headers: nil, params: nil)
        challengeTask = challengeService.getData(endPoint: challengeEndpoint, completion: { (result: Result<GetChallengeResult,Error>) in
            switch result {
            case .success(let data):
                if !KeychainService.savePassword(service: "PTecnica", account: "token", data: data.result?.token ?? "") {
                    KeychainService.updatePassword(service: "OnRoad", account: "token", data: data.result?.token ?? "")
                }
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeResponse"), object: data)
            case .failure(let error):
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "challengeFailed"), object: error)
            }
        })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

