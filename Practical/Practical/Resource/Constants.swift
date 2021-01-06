//
//  Constants.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import Foundation
import UIKit

var baseURL : String {
    switch AppManager.shared.appStatus {
    case .production:
        return "https://newsapi.org/v2/"
    case .staging:
        return "https://newsapi.org/v2/"
    case .local:
        return "https://newsapi.org/v2/"
    }
}
struct Storyboard {
    static let main = "Main"
}
struct Controller {
    static var web : WebViewController {
        (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController)!
    }
    static var newsDetail : DetailsViewController {
        (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
    }
    static var newsImageDetail : ImageViewController {
           (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController)!
       }
}

struct CellNib {
    static let NewsListCell       = UINib(nibName: CellIdentifier.NewsListCell, bundle: nil)    
}

struct CellIdentifier {
    static let NewsListCell       = "ListTableViewCell"
}
struct Strings {
    static let AlertOk = "Ok"
    static let AlertTitle = "Practical"
    static let FailureOperation = "Something went wrong. Please try again later"
    static let Done = "Done"
    static let AlerYES = "Yes"
    static let AlertCancel = "Cancel"
    static let appTitle = "Coinstelly"
    static let appTitleDetail = "Coinstelly"
}
struct APIName {
    static var APINewsList = baseURL + "top-headlines"
    
}
struct Keys {
    static let APIKey =  "d0b28b37b0e7419897624521399a48c5"
}
