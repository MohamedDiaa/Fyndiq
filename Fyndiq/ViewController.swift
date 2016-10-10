//
//  ViewController.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let homeVC = HomeTableViewController(nibName: "HomeTableViewController", bundle: nil)
       
        let navController = UINavigationController(rootViewController: homeVC)
        
        navController.navigationBar.backgroundColor = UIColor.fyndiq
        
        
        self.addChildViewController(navController)
        
        self.view.addSubview(navController.view)
        navController.view.translatesAutoresizingMaskIntoConstraints = false
        
        let c1 = NSLayoutConstraint(item: navController.view, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0.0)
       
        let c2 = NSLayoutConstraint(item: navController.view, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
      
        let c3 = NSLayoutConstraint(item: navController.view, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        let c4 = NSLayoutConstraint(item: navController.view, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints([c1,c2,c3,c4])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

