//
//  TextFieldViewController.swift
//  SampleCollection
//
//  Created by Miyo Lee on 2022/04/12.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.becomeFirstResponder()
        lbResult.isHidden = true
    }
    

    @IBAction func DoneBtnTouched(_ sender: Any) {
        lbResult.isHidden = false
        if(isDoneAvailable()){
            lbResult.text = """
                            이름 : \((tfName.text!))
                            휴대폰 번호 : \(tfPhone.text!)
                            Email : \(tfEmail.text!)
                            """
            resignAllResponder()
        }else{
            lbResult.text = "이름, 휴대폰 번호, Email 모두 입력해 주세요."
        }
        
    }
    
    func resignAllResponder(){
        tfName.resignFirstResponder()
        tfPhone.resignFirstResponder()
        tfEmail.resignFirstResponder()
    }

    func isDoneAvailable() -> Bool{
        return !tfName.text!.isEqual("") && !tfPhone.text!.isEqual("") && !tfEmail.text!.isEqual("")
    }
    
}
