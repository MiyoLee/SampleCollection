//
//  WebKitViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/18.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var vWeb: UIView!
    @IBOutlet weak var wkTest: WKWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        vWeb.alpha = 0
        wkTest.customUserAgent = "myhyundai_ios"
        loadWebPage("https://myhyundai.hmc.co.kr")
    }
    
    @IBAction func openBtnTouched(_ sender: Any) {
        //closure
        //함수의 파라미터 타입으로 클로저를 전달
        UIView.animate(withDuration: 1, animations: { () -> () in
            self.vWeb.alpha = 1
        })
    }
    
    @IBAction func closeBtnTouched(_ sender: Any) {
        vWeb.alpha = 0
    }
    
    func loadWebPage(_ url:String) {
        if let myUrl = URL(string: url) {
            wkTest.load(URLRequest(url: myUrl))
        }
    }
}
