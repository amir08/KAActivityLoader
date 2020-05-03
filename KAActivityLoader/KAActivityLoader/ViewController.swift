//
//  ViewController.swift
//  KAActivityLoader
//
//  Created by Amir on 28/07/19.
//  Copyright © 2019 Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnActionShowLoader(_ sender: Any) {
        // Showing loader when you need
        showActivityLoader()
        // Change loading text when needed
        self.perform(#selector(changeLoaderText), with: nil, afterDelay: 5.0)
    }
    
    //MARK:- Show Activy loader
    /**
     Show activity loader and pass loading text
     */
    private func showActivityLoader() {
        ActivityLoaderManager.shared.showLoader(text: "Loading...")
    }
    
    
    //MARK:- Change loader text
    /**
     Change loading text
     */
   @objc
   private func changeLoaderText() {
        ActivityLoaderManager.shared.changeLoaderText(newText: "Still loading...")
        self.perform(#selector(hideActivityLoader), with: nil, afterDelay: 5.0)
    }
    
    //MARK:- Hide loader
    /**
     Hide activity loader when done
     */
    @objc
    private func hideActivityLoader(){
        ActivityLoaderManager.shared.hideLoader()
    }

}

