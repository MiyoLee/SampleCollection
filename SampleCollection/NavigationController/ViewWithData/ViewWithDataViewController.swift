//
//  ViewWithDataViewController.swift
//  AutoLayout_ex1
//
//  Created by Miyo Lee on 2022/04/04.
//

import UIKit

class ViewWithDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnMove1(_ sender: Any) {
        guard let BasicTableVC = self.storyboard?.instantiateViewController(withIdentifier: "BasicTableVC") else { return }
        self.navigationController?.pushViewController(BasicTableVC, animated: true)
    }
    
    @IBAction func btnMove2(_ sender: Any) {
        guard let Basic2TableVC = self.storyboard?.instantiateViewController(withIdentifier: "Basic2TableVC") else { return }
        self.navigationController?.pushViewController(Basic2TableVC, animated: true)
    }
    
    @IBAction func btnMove3(_ sender: Any) {
        guard let CustomTableVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomTableVC") else { return }
        self.navigationController?.pushViewController(CustomTableVC, animated: true)
    }
    
    @IBAction func btnMove4(_ sender: Any) {
        guard let SettingTableVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingTableVC") else { return }
        self.navigationController?.pushViewController(SettingTableVC, animated: true)
    }
}
