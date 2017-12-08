//
//  ViewController.swift
//  SimpleServiceRegistry
//
//  Created by Vincent Bernier on 01/16/2017.
//  Copyright (c) 2017 Vincent Bernier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let serviceRegistry = ServiceRegistry.sharedInstance
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Using a service store in the Service Registry
        //  We are using our subclass of ServiceRegistry that was adding the *sharedInstance* property
        let sizingRules = serviceRegistry.serviceUnwrapped(for: SizingRules.self)
        titleLabel.font = UIFont.systemFont(ofSize: sizingRules.titleTextSize)
        titleLabel.backgroundColor = UIColor.orange
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //  Using a service store in the Service Registry
        //  We are using our subclass of ServiceRegistry that was adding the *sharedInstance* property
        let sizingRules = serviceRegistry.serviceUnwrapped(for: SizingRules.self)
        view.layoutMargins = UIEdgeInsets(top: view.layoutMargins.top,
                                          left: sizingRules.screenLeftPadding,
                                          bottom: view.layoutMargins.bottom,
                                          right: sizingRules.screenRightPadding)
    }
    
}

