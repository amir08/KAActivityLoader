//
//  KAActivityLoaderView.swift
//  KAActivityLoader
//
//  Created by Amir on 6/3/18.
//  Copyright © 2018 Khan Amir. All rights reserved.
//

import UIKit

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
    fileprivate func initializeLoader(){

        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        let width: CGFloat = self.frame.size.width
        let x = (self.bounds.size.width / 2) - 20
        let y = (self.bounds.size.height / 2) - 20
        
        activityIndicator.frame = CGRect(x: x, y: y, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.hidesWhenStopped = true
        
        self.addSubview(activityIndicator)
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
     
     - Parameter loaderText: String type to show on loader.
     
     */
    func showActivityIndicator(loaderText: String) {
        
        DispatchQueue.main.async {
    
            self.loadingLabel.text = loaderText
            self.activityIndicator.startAnimating()
            UIApplication.shared.keyWindow?.addSubview(self)
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
