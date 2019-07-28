//
//  ActivityLoaderManager.swift
//  KAActivityLoader
//
//  Created by Amir on 6/3/18.
//  Copyright © 2018 Khan Amir. All rights reserved.
//

import UIKit

class ActivityLoaderManager: NSObject {

    static let shared = ActivityLoaderManager()
    
    private let activityLoader = KAActivityLoaderView()
    
    //MARK:- Show Loader on screen
    /**
     Show activity loader with initial text
     
     - Parameter text: String type to show on loader.
     
     */
    
    func showLoader(text: String) {
        
         activityLoader.showActivityIndicator(loaderText: text)
    }
    
    
    //MARK:- Change Loading text
    /**
     Change activity loader text
     
     - Parameter newText: String type to replace loading text on loader.
     
     */
    func changeLoaderText(newText: String) {
        
        if activityLoader.activityIndicator.isAnimating {
            
            activityLoader.loadingLabel.text = newText
            
        }
        else{
            
            debugPrint("Initialized the loader first!")
        }
        
    }
    
    //MARK:- Hide Loader
    /**
     Hide activity loader
     */
    func hideLoader() {
        
        activityLoader.hideActivityIndicator()
    }
    
}
