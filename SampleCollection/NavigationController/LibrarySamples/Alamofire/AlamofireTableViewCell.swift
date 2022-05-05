//
//  AlamofireTableViewCell.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/05/05.
//

import UIKit

class AlamofireTableViewCell: UITableViewCell{
    
    @IBOutlet weak var lbBloggerName: UILabel!
    @IBOutlet weak var lbPostDate: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    func setUp(bloggerName: String, postDate: String, title: String, description: String){
        lbBloggerName.text = bloggerName
        lbPostDate.text = postDate
        lbTitle.text = title
        lbDescription.text = description
    }
}
