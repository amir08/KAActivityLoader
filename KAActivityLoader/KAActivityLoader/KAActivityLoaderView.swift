//
//  KAActivityLoaderView.swift
//  KAActivityLoader
//
//  Created by Amir on 6/3/18.
//  Copyright © 2018 Khan Amir. All rights reserved.
//

import UIKit

extension UIApplication {
    @available(iOS 13.0, *)
    var currentWindow: UIWindow? {
        connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
}

class KAActivityLoaderView: UIView {

    var activityIndicator = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    var isShowing: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        initializeLoader()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    //MARK:- initialize Loader
    /**
     Initialize loader controls
     */
    private func initializeLoader(){
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let x = (self.bounds.size.width / 2) - 20
        let y = (self.bounds.size.height / 2) - 20
        activityIndicator.frame = CGRect(x: x, y: y, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        initializeLoaderTextLabel()

    }
    
    //MARK:- Initialize Loader Text Label
    /**
     Set frame of loading text label
     */
    private func initializeLoaderTextLabel() {
        let width: CGFloat = self.frame.size.width
        loadingLabel.frame = CGRect(x: 16, y: activityIndicator.frame.maxY, width: width - 32.0, height: 40)
        loadingLabel.textColor = UIColor.white
        loadingLabel.textAlignment = .center
        loadingLabel.numberOfLines = 0
        loadingLabel.lineBreakMode = .byWordWrapping
        loadingLabel.font = UIFont.systemFont(ofSize: 17.0)
        self.addSubview(loadingLabel)
    }

     //MARK:- Show activity indicator
    /**
     Show activity indicatore with loading text
     - Parameter loaderText: String type to show on loader. Pass nil if not needed
     */
    func showActivityIndicator(loaderText: String?) {
        DispatchQueue.main.async {
            if let text = loaderText {
                self.loadingLabel.text = text
            }
            
            if #available(iOS 13.0, *) {
                if let window = UIApplication.shared.currentWindow {
                    window.addSubview(self)
                }else{
                    debugPrint("KAActivityLoader: Oops no window found!")
                }
            } else {
               UIApplication.shared.keyWindow?.addSubview(self)
            }
            
            self.activityIndicator.startAnimating()
            self.isShowing = true
            
        }
    }
    
     //MARK:- Hide activity indicator
    /**
     Hide activity indicator when done
     */
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.isShowing = false
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        }
    }

}
