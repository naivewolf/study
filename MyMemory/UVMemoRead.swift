//
//  UVMemoRead.swift
//  MyMemory
//
//  Created by Naivewolf on 2020/02/04.
//  Copyright © 2020 Naivewolf. All rights reserved.
//

import UIKit

class UVMemoRead: UIViewController
{
    var m_param : MemoData?
    
    @IBOutlet var m_lbSubject: UILabel!
    @IBOutlet var m_lbContents: UILabel!
    @IBOutlet var m_imgView: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.m_lbSubject.text = m_param?.title
        self.m_lbContents.text = m_param?.contents
        self.m_imgView.image = m_param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (m_param?.regdate)!)
        
        self.navigationItem.title = dateString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
