//
//  VCMemoForm.swift
//  MyMemory
//
//  Created by Naivewolf on 2020/02/04.
//  Copyright © 2020 Naivewolf. All rights reserved.
//

import UIKit

class VCMemoForm: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate
{
    var subject: String!
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.contents.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btActionSave(_ sender: Any)
    {
        guard self.contents.text?.isEmpty == false else
        {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        let data = MemoData()
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        //앱 델리게이트 객체를 읽어온 다음 memolist 배열에 MemoData 객체를 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //작성폼 화면을 종료하고 이전 화면으로
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btActionPick(_ sender: Any)
    {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
        
    }
    
    func textViewDidChange(_ textView: UITextView)
    {
        let contents = textView.text as NSString
        let length = (( contents.length > 15) ? 15: contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
    }
    
}
