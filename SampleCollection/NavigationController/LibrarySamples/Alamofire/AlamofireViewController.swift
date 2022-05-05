//
//  AlamofireSampleViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/05/04.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    var blogItems: [Item] = []  //Item 배열
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tvBlogs: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func callSearchBtnTouched(_ sender: Any) {
        if let text = tfSearch.text{
            searchBlog(query: text)
        }
    }
    
    func searchBlog(query: String){
        let url = "https://openapi.naver.com/v1/search/blog.json"
        let query = ["query": query, "display": "30"]
        let header: HTTPHeaders = ["X-Naver-Client-Id": "dL5LcItCX1MHRO1h_Lzt",
                       "X-Naver-Client-Secret": "wcWtj4NoxM"]
        
        AF.request(url, method: .get, parameters: query, headers: header)
            .responseDecodable(completionHandler: { [weak self] (response : DataResponse<Blog, AFError>) in
            NSLog("response : \(response)")
            switch (response.result) {
            case .success(let data):
                NSLog("data : \(data)")
                self?.blogItems = data.items
                self?.tvBlogs.reloadData()
            default:
                NSLog("response: \(response)")
            }
        })
        
    }
    func removeHTMLTag(text: String) -> String {
        var removedText = text
        if (removedText.contains("<b>") || removedText.contains("</b>") || removedText.contains("&quot;") ||
            removedText.contains("&lt;") || removedText.contains("&gt;") || removedText.contains("&amp;")) {
                removedText = removedText.replacingOccurrences(of: "<b>", with: "")
                removedText = removedText.replacingOccurrences(of: "</b>", with: "")
                removedText = removedText.replacingOccurrences(of: "&quot;", with: "\"")
                removedText = removedText.replacingOccurrences(of: "&lt;", with: "<")
                removedText = removedText.replacingOccurrences(of: "&gt;", with: ">")
                removedText = removedText.replacingOccurrences(of: "&amp;", with: "&")
        }
        return removedText
    }
}


// MARK: table view datasource
extension AlamofireViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell") as! AlamofireTableViewCell
        let item = blogItems[indexPath.row]
        let bloggerName = removeHTMLTag(text: item.bloggername)
        let postDate = removeHTMLTag(text: item.postdate)
        let title = removeHTMLTag(text: item.title)
        let description = removeHTMLTag(text: item.itemDescription)
        
        cell.setUp(bloggerName: bloggerName, postDate: postDate, title: title, description: description)
        
        return cell
    }
    
}

// MARK: table view delegate
extension AlamofireViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlamofireViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfSearch:
            callSearchBtnTouched((Any).self)
        default: break
        }
        return true
    }
}

// MARK: - Blog
struct Blog: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let itemDescription, bloggername: String
    let bloggerlink: String
    let postdate: String

    enum CodingKeys: String, CodingKey {
        case title, link
        case itemDescription = "description"
        case bloggername, bloggerlink, postdate
    }
}

class AlamofireTableViewCell: UITableViewCell{
    
    @IBOutlet weak var lbBloggerName: UILabel!
    @IBOutlet weak var lbPostDate: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    func setUp(bloggerName: String, postDate: String, title: String, description: String){
        lbBloggerName.text = bloggerName
        lbPostDate.text = postDate
        lbTitle.text = title
        lbDescription.text = description
    }
}
