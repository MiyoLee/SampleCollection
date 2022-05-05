//
//  KingfisherSampleViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/21.
//

import UIKit
import Kingfisher

class KingfisherViewController: UIViewController {
    
    let url = URL(string: "https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_280/5-3-%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg")
    @IBOutlet weak var ivTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let processor = DownsamplingImageProcessor(size: ivTest.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        ivTest.kf.indicatorType = .activity
        ivTest.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }

}
