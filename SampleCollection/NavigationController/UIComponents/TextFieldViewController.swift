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
        
        initializeUI()
        setDelegate()
        tfName.becomeFirstResponder()
    }
    
    func initializeUI(){
        lbResult.isHidden = true
    }

    //스토리보드에서 delegate 붙이기도 가능
    func setDelegate(){
        tfName.delegate = self
        tfPhone.delegate = self
        tfEmail.delegate = self
    }
    
    @IBAction func DoneBtnTouched(_ sender: Any) {
        registerUser()
    }
    
    func registerUser(){
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
        return !tfName.text!.isEmpty &&
        !tfPhone.text!.isEmpty &&
        !tfEmail.text!.isEmpty
    }
    
}

extension TextFieldViewController: UITextFieldDelegate{
    
    //입력해서 바뀔때
    //range :
    //string : 새로 입력된 문자열
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        NSLog("shouldChangeCharactersIn \(range) \(string)")
        
        switch(textField){
        case tfName:    //문자나 띄어쓰기일 경우만 true 리턴(입력 가능)
            if !CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: string)) &&
                !CharacterSet.whitespaces.isSuperset(of: CharacterSet(charactersIn: string)){
                return false
            }
        case tfPhone:   //숫자 - + ( ) 경우만 true 리턴(입력 가능)
            let phoneCharacterSet = CharacterSet(charactersIn: "0123456789+-()")
            if !phoneCharacterSet.isSuperset(of: CharacterSet(charactersIn: string)){
                return false
            }
        default:
            break
        }
        return true
    }
    
    //입력 시작할때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("textFieldDidBeginEditing")
    }
    
    //입력 끝났을때
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("textFieldDidEndEditing")
    }
    
    //엔터키 입력했을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("textFieldShouldReturn")
        switch (textField){
        case tfName:
            tfPhone.becomeFirstResponder()
        case tfPhone:
            tfEmail.becomeFirstResponder()
        case tfEmail:
            registerUser()
        default:
            break
        }
        return true
    }
}
