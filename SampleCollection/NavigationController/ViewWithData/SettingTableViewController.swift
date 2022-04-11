//
//  SettingTableViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/08.
//

import UIKit

class SettingTableViewController: UIViewController {
    
    let section1 = ["정보"]
    let section2 = ["키보드", "게임 컨트롤러", "서체", "언어 및 지역", "사전"]
    let section3 = ["전송 또는 iPhone 재설정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: Data Source
extension SettingTableViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return section1.count
        case 1:
            return section2.count
        case 2:
            return section3.count
        default:
            return 0
        }
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell

        let sectionNum = indexPath.section
        let rowNum = indexPath.row
        
        var title = ""
        switch(sectionNum){
        case 0:
            title = section1[rowNum]
        case 1:
            title = section2[rowNum]
            if rowNum == 1{
                cell.selectionStyle = .none
                cell.lbTitle.textColor = UIColor.gray
            }
        case 2:
            title = section3[rowNum]
        default:
            NSLog("default")
        }
        
        cell.lbTitle.text = title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}

//MARK: Delegate
extension SettingTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //'정보' 클릭 했을때
        if indexPath.section == 0 && indexPath.row == 0 {
            guard let InfoTableVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoTableVC") else { return }
            self.navigationController?.pushViewController(InfoTableVC, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
}
