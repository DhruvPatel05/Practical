//
//  AppManager.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import Foundation
import IQKeyboardManager


class AppManager: NSObject {
    enum AppStatusType : Int {
        case production
        case staging
        case local
    }
    
    static let shared = AppManager()
    var appStatus : AppStatusType = .local
    func setApp()
    {
        IQKeyboardManager.shared().isEnabled = true
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().isTranslucent = false
    }
}
