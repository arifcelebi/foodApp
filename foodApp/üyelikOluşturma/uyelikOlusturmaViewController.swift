//
//  uyelikOlusturmaViewController.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit



class uyelikOlusturmaViewController: UIViewController {

    var delegate:KayitToViewProtocol?
    
    
    @IBOutlet weak var textFieldKullaniciAdi: UITextField!
    
    @IBOutlet weak var textFieldSifre: UITextField!
    @IBOutlet weak var textFieldMail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kayitButton(_ sender: Any) {
        
            if let mg = textFieldMail.text, let kg = textFieldKullaniciAdi.text , let sg = textFieldSifre.text{
            delegate?.veriGönder(email: mg, kullanici_adi: kg, sifre: sg)
            
            
                
        }
    }
    

}
