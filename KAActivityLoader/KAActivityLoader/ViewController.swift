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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showActivityLoader()
        
        self.perform(#selector(changeLoaderText), with: nil, afterDelay: 5.0)
        
    }
    
    //MARK:- Show Activy loader
    /**
     Show activity loader and pass loading text
     */
    func showActivityLoader() {
        
        ActivityLoaderManager.shared.showLoader(text: "Loading")
    }
    
    //MARK:- Change loader text
    /**
     Change loading text
     */
   @objc func changeLoaderText() {

        ActivityLoaderManager.shared.changeLoaderText(newText: "Still loading")
    
        self.perform(#selector(hideActivityLoader), with: nil, afterDelay: 5.0)
    
    }
    
    //MARK:- Hide loader
    /**
     Hide activity loader when done
     */
    @objc func hideActivityLoader(){
        
        ActivityLoaderManager.shared.hideLoader()
        
    }

}

