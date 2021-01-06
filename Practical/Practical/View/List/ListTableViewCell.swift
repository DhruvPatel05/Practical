//
//  ListTableViewCell.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import UIKit
import SDWebImage

class ListTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var article : NewsArticle? {
        didSet {
            self.setupCell()
        }
    }
    override func prepareForReuse() {
        self.newsImage.image = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setupCell()
    {
        self.newsImage?.sd_setImage(with: URL.init(string: article?.urlToImage ?? "")) { (image, error, cache, urls) in
            if (error != nil) {
                self.newsImage?.image = #imageLiteral(resourceName: "icn_Default")
            } else {
                self.newsImage.image = image
            }
        }
        self.newsTitle.text = article?.title
        self.newsAuthor.text = article?.author
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy h:mm"
        let date = dateFormatter.date(from: article?.publishedAt ?? "")
        self.newsDate.text =  self.article?.title?.formatDateToString(dateNew: date, format: "MM-dd-yyyy h:mm", isDate: true)
        
    }
}
