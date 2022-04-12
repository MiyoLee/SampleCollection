//
//  SampleLabelViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/11.
//

import UIKit

class SampleLabelViewController: UIViewController {

    @IBOutlet weak var lbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickBtnTouched(_ sender: Any) {
//        lbLabel.textColor = .green
        
        if let text = lbLabel.text{
            
        let attributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.green, .font: UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        ]
            
        
            lbLabel.attributedText = NSMutableAttributedString.init(string: text, attributes: attributes)
        }
    }
}
