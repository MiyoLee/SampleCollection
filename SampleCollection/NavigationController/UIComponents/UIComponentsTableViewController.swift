//
//  UIComponentsTableViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/11.
//

import UIKit

class UIComponentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func labelBtnTouched(_ sender: Any) {
        guard let SampleLabelVC = self.storyboard?.instantiateViewController(withIdentifier: "SampleLabelVC") else { return }
        self.navigationController?.pushViewController(SampleLabelVC, animated: true)
    }
    
    @IBAction func textFieldBtnTouched(_ sender: Any) {
        guard let TextFieldVC = self.storyboard?.instantiateViewController(withIdentifier: "TextFieldVC") else { return }
        self.navigationController?.pushViewController(TextFieldVC, animated: true)
    }
    
    @IBAction func webKitBtnTouched(_ sender: Any) {
        guard let WebKitVC = self.storyboard?.instantiateViewController(withIdentifier: "WebKitVC") else { return }
        self.navigationController?.pushViewController(WebKitVC, animated: true)
    }
}
