//
//  CustomViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/05.
//

import UIKit

class CustomTableViewController: UIViewController{
    
    let sections = ["우량주", "성장주", "코인"]
    let arrImage = ["dollarsign.circle", "dollarsign.circle", "bitcoinsign.circle"]
    
    let arrWoo = ["삼성전자", "현대자동차", "LG생활건강"]
    let arrDescWoo = ["69,200", "177,500", "912,000"]

    let arrSung = ["LG에너지솔루션", "카카오뱅크", "셀트리온"]
    let arrDescSung = ["443,000", "50,200", "170,000"]

    let arrCoin = ["비트코인", "이더리움", "도지코인"]
    let arrDescCoin = ["56,891,000", "4,293,000", "184"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: UITableView DataSource
extension CustomTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        
        let sectionNum=indexPath.section
        let rowNum=indexPath.row
        
        let img = arrImage[sectionNum]
        var title = ""
        var desc = ""
        
        switch(sectionNum){
        case 0: title = arrWoo[rowNum]
                desc = arrDescWoo[rowNum]
        case 1: title = arrSung[rowNum]
                desc = arrDescSung[rowNum]
        case 2: title = arrCoin[rowNum]
                desc = arrDescCoin[rowNum]
        default: NSLog("default")
            
        }
        
        cell.setup(title: title, desc: desc, img: img)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
}

//MARK: UITableView Delegate
extension CustomTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    

