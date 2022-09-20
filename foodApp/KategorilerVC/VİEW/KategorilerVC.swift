//
//  ViewController.swift
//  foodApp
//
//  Created by Arif Celebi on 16.09.2022.
//

import UIKit
import Kingfisher


class KategorilerVC: UIViewController {


    @IBOutlet weak var yemekTableView: UITableView!
    
    
    var yemeklerListe = [Yemekler]()
    var KategorilerPresenterNesnesi:ViewToPresenterKategorilerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        yemekTableView.delegate = self
        yemekTableView.dataSource = self
        
        
        KategorilerRouter.createModule(ref: self)
        
    }


    @IBAction func buttonSepetim(_ sender: Any) {
        
        performSegue(withIdentifier: "toSepet", sender: nil)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        KategorilerPresenterNesnesi?.yemekleriAl()
        
        
    }
}

extension KategorilerVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let yemek = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! KategorilerTableViewCell
        
        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        
        
        hucre.yemekResimImageView.kf.setImage(with: yemekResim)
        
        hucre.yemekAdiLabel.text = yemek.yemek_adi
        
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.selectionStyle = .none
        return hucre
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            
            if let y = sender as? Yemekler{
                let gidilecekVC = segue.destination as? DetayViewController
                gidilecekVC?.yemek = y
                
            }
        }
        
        
    }
}
        
        
        extension KategorilerVC:PresenterToViewKategorilerProtocol{
            
            func viewVeriGönder(yemekListesi: Array<Yemekler>) {
                self.yemeklerListe = yemekListesi
                DispatchQueue.main.async {
                    self.yemekTableView.reloadData()
                }
            }
        }
        
        
    
