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
        guard let KingfisherVC = self.storyboard?.instantiateViewController(withIdentifier: "KingfisherVC") else { return }
        self.navigationController?.pushViewController(KingfisherVC, animated: true)
    }
    
    @IBAction func alamofireSampleBtnTouched(_ sender: Any) {
        // navigation controller 로 화면 전환
        guard let AlamofireVC = self.storyboard?.instantiateViewController(withIdentifier: "AlamofireVC") else { return }
        self.navigationController?.pushViewController(AlamofireVC, animated: true)
    }
}
