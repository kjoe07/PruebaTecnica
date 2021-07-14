//
//  UIViewControllerExtension.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit
extension UIViewController {
    func showActivityIndicator() {
        let container: UIView = UIView()
        let loadingView: UIView = UIView()
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        container.tag = 100
        activityIndicator.tag = 101
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = .lightGray
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = self.view.center
        loadingView.backgroundColor = .darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     */
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if let activity =   self.view.viewWithTag(101) {
                (activity as? UIActivityIndicatorView)?.stopAnimating()
            }
            self.view.viewWithTag(100)?.removeFromSuperview()
        }
    }
}
