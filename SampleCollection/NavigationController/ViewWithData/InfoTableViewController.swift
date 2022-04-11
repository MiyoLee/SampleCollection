//
//  InfoTableViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/11.
//

import UIKit

class InfoTableViewController: UIViewController {
    
    let title1 = ["이름", "소프트웨어 버전", "모델명", "모델 번호", "일련번호"]
    let desc1 = ["iPhone", "15.3.1", "iPhone 12 mini", "MGE73KH/A", "FFWDT5AT0GQ1"]
    let title2 = ["노래", "비디오", "사진", "응용 프로그램", "전체 공간", "사용 가능 공간"]
    let desc2 = ["0", "176", "5,871", "116", "128GB", "65.07GB"]
    let title3 = ["인증서 신뢰 설정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
// MARK: Table View DataSource
extension InfoTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0: return title1.count
        case 1: return title2.count
        case 2: return title3.count
        default: return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        
        let sectionNum = indexPath.section
        let rowNum = indexPath.row
        var title = ""
        var desc = ""
        
        let attributes: [NSMutableAttributedString.Key: Any]
        attributes = [.foregroundColor: UIColor.lightGray]
        
        switch(sectionNum){
        case 0:
            title = title1[rowNum]
            desc = desc1[rowNum]
        case 1:
            title = title2[rowNum]
            desc = desc2[rowNum]
        case 2:
            title = title3[rowNum]
            cell.accessoryType = .disclosureIndicator
        default:
            title = "title"
            desc = "desc"
        }
        
        cell.lbTitle.text = title
        cell.lbDesc.attributedText = NSAttributedString.init(string: desc, attributes: attributes)
        
        return cell
    }
    
}

// MARK: Table View Delegate
extension InfoTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}
    

