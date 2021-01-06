//
//  ViewController.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class ViewCotroller: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBOutlet weak var filterCollection: UICollectionView!
    
    var news : [NewsArticle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Strings.appTitle
        self.getNews()
        self.setupTableview()
    }
    func setupTableview ()
    {
        self.newsTableView.register(CellNib.NewsListCell, forCellReuseIdentifier: CellIdentifier.NewsListCell)
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        self.newsTableView.rowHeight = UITableView.automaticDimension
        self.newsTableView.estimatedRowHeight = UITableView.automaticDimension
        self.newsTableView.reloadData()
    }
   
    @objc func newsLinkClicked(_ sender : UIButton)
    {
        let vcLink = Controller.web
        vcLink.linkURL = self.news[sender.tag].url ?? ""
        self.navigationController?.pushViewController(vcLink, animated: true)
    }
    @objc func newsTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let touch = tapGestureRecognizer.location(in: newsTableView)
        if let indexPath = newsTableView.indexPathForRow(at: touch) {
            let vcLink = Controller.web
            vcLink.linkURL = self.news[indexPath.row].url ?? ""
            self.navigationController?.pushViewController(vcLink, animated: true)
        }
        
    }
}

extension ViewCotroller
{
    //MARK: API
    func getNews()
    {
        let parameters = [
            "sources=google-news",
            "apiKey=\(Keys.APIKey)"
            ].joined(separator: "&")
        let URL = "\(APIName.APINewsList)?\(parameters)"
        APIManager.manager.getAPI(APIName: URL, params:[:], success: { (response) in
            DispatchQueue.main.async {
                debugPrint(response.count)
                let appDataRes = Mapper<NewsResponse>().map(JSON: response)
                debugPrint(appDataRes!)
                self.news = appDataRes?.articles ?? [NewsArticle()]
                self.newsTableView.reloadData()
                PTProgressHUDManager.showKRProgressHUD(false)
            }
        }) { (error) in
            DispatchQueue.main.async {
                PTProgressHUDManager.showKRProgressHUD(false)
            }
        }
    }
}

extension ViewCotroller : UITableViewDelegate , UITableViewDataSource
{
    //MARK: Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NewsListCell, for: indexPath) as? ListTableViewCell
        {
            cell.article = news[indexPath.row]
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(newsTapped(tapGestureRecognizer:)))
            cell.newsAuthor.isUserInteractionEnabled = true
            cell.newsAuthor.addGestureRecognizer(tapGestureRecognizer)
            
            return cell
        }
        return UITableViewCell()
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)    {
        
        let vcDetail = Controller.newsDetail
        vcDetail.article = self.news[indexPath.row]
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}

