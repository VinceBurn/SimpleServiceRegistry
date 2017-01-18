//
//  Measurements.swift
//  SimpleServiceRegistry
//
//  Created by Vincent Bernier on 17-01-17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

protocol SizingRules {
    var screenLeftPadding:      CGFloat     {get}
    var screenRightPadding:     CGFloat     {get}
    
    var titleTextSize:          CGFloat     {get}
}

struct SizingRules_iPhone : SizingRules {
    
    let screenLeftPadding: CGFloat = 10.0
    let screenRightPadding: CGFloat = 10.0
    
    let titleTextSize: CGFloat = 16.0
}

struct SizingRules_iPad : SizingRules {
    
    let screenLeftPadding: CGFloat = 40.0
    let screenRightPadding: CGFloat = 40.0
    
    let titleTextSize: CGFloat = 22.0
}
