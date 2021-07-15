//
//  ViewController.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTextField: BorderTextField!
    @IBOutlet weak var passwordTexfield: BorderTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginService: Services?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.challengeFinished(_:)), name: NSNotification.Name.init(rawValue: "challengeResponse"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.challengeFailed(_:)), name: NSNotification.Name.init(rawValue: "challengeFailed"), object: nil)
        showActivityIndicator()
        let loader = NetworkLoader(session: URLSession.shared)
        loginService = RemoteDataService(loader: loader)
    }

    @IBAction func login(_ sender: Any) {
        if KeychainService.loadPassword(service: "PTecnica", account: "token") != nil {
            login()
        }
    }
    
    @objc func challengeFinished(_ notification: NSNotification) {
        DispatchQueue.main.async {
            self.loginButton.isEnabled = true
            self.hideActivityIndicator()
        }
    }
    @objc func challengeFailed(_ notification: NSNotification) {
        debugPrint("error ocurred in challeged")
        //TODO: - get task from appDelegate and resume.
        let alert = UIAlertController(title: "Error", message: "Login Failed", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancel)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    func login() {
        let token = KeychainService.loadPassword(service: "PTecnica", account: "token") ?? ""
        debugPrint("token value:",token)
        let md5 = MD5().MD5(string: "\(token)d0n9nzY6w66xuJtd")
        let params = ["operation": "login","username":userTextField.text ?? "prueba","accessKey": md5]
        let loginEndpoint = HomeEndpoint(method: .post, path: "/datacrm/pruebatecnica/webservice.php", queryItems: nil, headers: ["Content-Type": "application/x-www-form-urlencoded"], params: params)
        showActivityIndicator()
        _ = loginService?.getData(endPoint: loginEndpoint, completion: { [weak self] (result: Result<LoginResponse,Error>) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.hideActivityIndicator()
                switch result {
                case .success(let data):
                   // KeychainService.savePassword(service: "TP", account: "session", data: data.result?.sessionName ?? "")
                    if !KeychainService.savePassword(service: "PTecnica", account: "session", data: data.result?.sessionName ?? "") {
                        KeychainService.updatePassword(service: "PTecnica", account: "session", data: data.result?.sessionName ?? "")
                    }
                    self.performSegue(withIdentifier: "contacts", sender: nil)
                case .failure(let error):
                    debugPrint("error",error.localizedDescription)
                }
            }
        })
    }
}

