//
//  CustomTableViewCell.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/06.
//

import Foundation
import UIKit
class CustomTableViewCell : UITableViewCell{
    
    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbDesc: UILabel!
    
    func setup(title: String, desc: String, img: String){
        lbTitle.text=title
        lbDesc.text=desc
        imgIcon.image=UIImage.init(systemName: img)
    }
    
}
