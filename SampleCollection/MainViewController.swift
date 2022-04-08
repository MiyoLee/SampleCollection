//
//  ViewController.swift
//  AutoLayout_ex1
//
//  Created by Miyo Lee on 2022/03/26.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnMove1(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let UIComponentsVC = self.storyboard?.instantiateViewController(withIdentifier: "UIComponents") else { return }
        self.navigationController?.pushViewController(UIComponentsVC, animated: true)
    }
    
    @IBAction func btnMove2(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let ViewSamplesVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewSamplesVC") else { return }
        self.navigationController?.pushViewController(ViewSamplesVC, animated: true)
    }
    
    @IBAction func btnMove3(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let ViewWithDataVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewWithDataVC") else { return }
        self.navigationController?.pushViewController(ViewWithDataVC, animated: true)
    }
}

