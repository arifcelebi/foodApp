//
//  createAccountViewController.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit


class createAccountViewController: UIViewController {
    
    @IBOutlet weak var kullaniciMail: UITextField!
    
    @IBOutlet weak var kullaniciAdi: UITextField!
    
    @IBOutlet weak var kullaniciSifre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    @IBAction func girisYap(_ sender: Any) {
                
    }
    @IBAction func kaydol(_ sender: Any) {
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKayit"{
            
            let gidilecekVC = segue.destination as! uyelikOlusturmaViewController
            gidilecekVC.delegate = self
            
        }
    }
    
}

extension createAccountViewController:KayitToViewProtocol{

    func veriGönder(email: String, kullanici_adi: String, sifre: String) {
        
        kullaniciMail.text = email
        kullaniciSifre.text = sifre
        
        kullaniciAdi.text = kullanici_adi
        
        
    }
    
}
