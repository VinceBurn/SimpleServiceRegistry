//
//  ViewController.swift
//  SimpleServiceRegistry
//
//  Created by Vincent Bernier on 01/16/2017.
//  Copyright (c) 2017 Vincent Bernier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.backgroundColor = UIColor.orange
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let sizingRules = ServiceRegistry.sharedInstance.serviceUnwrapped(for: SizingRules.self)
        view.layoutMargins = UIEdgeInsets(top: view.layoutMargins.top,
                                          left: sizingRules.screenLeftPadding,
                                          bottom: view.layoutMargins.bottom,
                                          right: sizingRules.screenRightPadding)
    }
    
}

