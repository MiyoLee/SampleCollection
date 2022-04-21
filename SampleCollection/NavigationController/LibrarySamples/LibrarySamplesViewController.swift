//
//  LibrarySamplesViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/21.
//

import UIKit

class LibrarySamplesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func kingfisherSampleBtnTouched(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let KingfisherSampleVC = self.storyboard?.instantiateViewController(withIdentifier: "KingfisherSampleVC") else { return }
        self.navigationController?.pushViewController(KingfisherSampleVC, animated: true)
    }
    
}
