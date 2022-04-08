//
//  ViewSamplesViewController.swift
//  AutoLayout_ex1
//
//  Created by Miyo Lee on 2022/04/04.
//

import UIKit

class ViewSamplesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func btnMove1(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let LockScreenVC = self.storyboard?.instantiateViewController(withIdentifier: "LockScreenVC") else { return }
        self.navigationController?.pushViewController(LockScreenVC, animated: true)
    }

}
