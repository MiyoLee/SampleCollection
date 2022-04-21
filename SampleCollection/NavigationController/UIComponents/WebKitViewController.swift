//
//  WebKitViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/18.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    let mainUrl = "http://m.naver.com"
    @IBOutlet weak var vWeb: UIView!
    @IBOutlet weak var wkTest: WKWebView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        setupWebView()
    }
    
    func setupWebView() {
        showWebView(isHidden: false, duration: 1)
        goHome()
        wkTest.uiDelegate = self
        wkTest.navigationDelegate = self
    }
    
    func checkWebViewButtons() {
        btnBack.isEnabled = wkTest.canGoBack
        btnForward.isEnabled = wkTest.canGoForward
    }
    
    func goHome() {
        loadWebPage(mainUrl)
    }
    
    func showWebView(isHidden: Bool, duration: Double) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            if isHidden {
                self?.vWeb.alpha = 0
            } else {
                self?.vWeb.alpha = 1
            }
        })
    }
    
    func loadWebPage(_ url:String) {
        if let myUrl = URL(string: url) {
            wkTest.load(URLRequest(url: myUrl))
        }
    }
    
    @IBAction func openBtnTouched(_ sender: Any) {
       showWebView(isHidden: false, duration: 1)
    }
    
    @IBAction func closeBtnTouched(_ sender: Any) {
        showWebView(isHidden: true, duration: 1)
    }
    
    @IBAction func backBtnTouched(_ sender: Any) {
        if wkTest.canGoBack {
            wkTest.goBack()
        }
    }
    
    @IBAction func forwardBtnTouched(_ sender: Any) {
        if wkTest.canGoForward {
            wkTest.goForward()
        }
    }
    
    @IBAction func homeBtnTouched(_ sender: Any) {
        goHome()
    }
    
    @IBAction func refreshBtnTouched(_ sender: Any) {
        wkTest.reload()
    }
    
}

extension WebKitViewController: WKUIDelegate {
    func webViewDidClose(_ webView: WKWebView) {
        NSLog("webViewDidClose : \(webView)")
    }
}

extension WebKitViewController: WKNavigationDelegate {
    //이 메소드가 불려지는 시점은 내가 가고 있는 목적지는 알고 있지만, 아직 가지 않은 상태이고 여기서 이동 허가를 하게 된다면 이동이 되어진다.
    // navigationAction : 다음에 로드 될 페이지의 정보? 라고 생각하면 쉬울 것이다.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        NSLog("decidePolicyFor \(navigationAction.request.url!)")
        
        if let url = navigationAction.request.url {
            if url.absoluteString.contains("https://new-m.pay.naver.com/") {
                decisionHandler(.cancel)
                NSLog("페이지 진입 금지 \(url)")
                return
            }
        }
        decisionHandler(.allow)
    }
    
    // 안착 된 후에 페이지 로드 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            NSLog("didCommit \(webView.url!)")
        }
        
    //메인 프레임에 안착 될 때
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("didStartProvisionalNavigation \(webView.url!)")
        checkWebViewButtons()
    }
        
    //페이지 로드가 완료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinish \(webView.url!)")
        checkWebViewButtons()
    }
        
    //로드 중 에러
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("didFail \(error)")
    }

}
