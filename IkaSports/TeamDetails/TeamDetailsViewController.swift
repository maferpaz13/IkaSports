//
//  TeamDetailsViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewButtonOut: UIView!
    @IBOutlet weak var scrollout: UIScrollView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var ShortNameLabel: UILabel!
    @IBOutlet weak var contenedorView: UIView!
    @IBOutlet weak var alternativeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var addressStadium: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var champion1: UILabel!
    @IBOutlet weak var champion2: UILabel!
    @IBOutlet weak var champion3: UILabel!
    @IBOutlet weak var websiteOut: UIButton!
    @IBOutlet weak var lineaYear: UIView!
    @IBOutlet weak var yearStack: UIStackView!
    @IBOutlet weak var championstack: UIStackView!
    @IBOutlet weak var lineachampion: UIView!
    @IBOutlet weak var lineaStadium: UIView!
    @IBOutlet weak var addressStack: UIStackView!
    @IBOutlet weak var networkStack: UIStackView!
    @IBOutlet weak var instaOut: UIImageView!
    @IBOutlet weak var faceOut: UIImageView!
    @IBOutlet weak var instaButtonOut: UIButton!
    @IBOutlet weak var FaceButtonOut: UIButton!
    @IBOutlet weak var twitterButtonOut: UIButton!
    @IBOutlet weak var twitterOut: UIImageView!
    @IBOutlet weak var lineanetwork: UIView!
    @IBOutlet weak var viewnetwork: UIView!
    //MARK: - IBActions
    @IBAction func moreInfo(_ sender: Any) {
        let closeAction = UITapGestureRecognizer(target: self, action: #selector(CloseView))
        showViewInfo(vista: self, info: infoteam?.strDescriptionEN ?? "", titulo: infoteam?.strStadium ?? "", closeAction: closeAction)
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        guard let url = URL(string: "https://\(infoteam?.strInstagram ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func facebookButton(_ sender: Any) {
        guard let url = URL(string: "https://\(infoteam?.strFacebook ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func twitterButton(_ sender: Any) {
        guard let url = URL(string: "https://\(infoteam?.strTwitter ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func websiteButton(_ sender: Any) {
        guard let url = URL(string: "https://\(infoteam?.strWebsite ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func Back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Properties
    var infoteam: TeamsModel.Teams?
    var arrayImage: [(String)] = []
    var Auxrow: Int8! = 0
    
    //MARK: - Constants


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    @objc func CloseView(_ sender: UITapGestureRecognizer) {
        
        hideViewInfo(vista: self)
        
    }
    
    func setUpUI() {
        
        //configuracion de imagen del logo
        let logoimage = URL(string:  infoteam?.strTeamBadge ?? "")
        self.logoImage.sd_setImage(with: logoimage)
        
        //configuracion de labels en la vista
        self.teamNameLabel.text = infoteam?.strTeam
        self.ShortNameLabel.text = infoteam?.strTeamShort
        self.alternativeLabel.text = infoteam?.strAlternate
        self.yearLabel.text = infoteam?.intFormedYear
        self.stadiumName.text = infoteam?.strStadium
        self.addressStadium.text = infoteam?.strStadiumLocation
        self.champion1.text = infoteam?.strLeague
        self.champion2.text = infoteam?.strLeague2
        self.champion3.text = infoteam?.strLeague3
        self.websiteOut.setTitle(infoteam?.strWebsite, for: .normal)
        self.websiteOut.setTitleColor(.blue, for: .normal)
        
        
        
        //validacion si el estadio existe
        if infoteam?.strStadium == nil {
            self.addressStack.isHidden = true
            self.lineaStadium.isHidden = true
            
        }else if infoteam?.strStadium == ""{
            
            self.addressStack.isHidden = true
            self.lineaStadium.isHidden = true
            
        }
        
        //validacion si año de creacion existe
        if infoteam?.intFormedYear == nil {
            
        self.yearStack.isHidden = true
        self.lineaYear.isHidden = true
            
        }else if (infoteam?.intFormedYear!.count)! < 4{
            
            self.yearStack.isHidden = true
            self.lineaYear.isHidden = true
            
        }
        //validacion si los campeonatos existen
        if infoteam?.strLeague == "" && infoteam?.strLeague2 == "" && infoteam?.strLeague3 == "" {
            
            self.championstack.isHidden = true
            self.lineachampion.isHidden = true
        }
        
        self.champion1.isHidden = infoteam?.strLeague == ""
        self.champion2.isHidden = infoteam?.strLeague2 == ""
        self.champion3.isHidden = infoteam?.strLeague3 == ""
        
        if let champion1 = infoteam?.strLeague {
            self.champion1.isHidden = champion1.contains("_No League")
        }
        if let champion2 = infoteam!.strLeague2 {
            self.champion2.isHidden = champion2.contains("_No League")
        }
        if let champion3 = infoteam!.strLeague3 {
            self.champion3.isHidden = champion3.contains("_No League")
        }
        
        
        
        //validacion si website existe
        if infoteam?.strWebsite == nil {
            
            self.websiteOut.isHidden = true
            
        }else if infoteam?.strWebsite == "" {
            
            self.websiteOut.isHidden = true
        }
        
        
        
        //validacion si social networks existen
        if infoteam?.strInstagram == nil {
            
        self.instaOut.isHidden = true
        self.instaButtonOut.isHidden = true
            
        }else if infoteam?.strInstagram == "" {
            
            self.instaOut.isHidden = true
            self.instaButtonOut.isHidden = true
        }
        if infoteam?.strFacebook == nil {
            
            self.faceOut.isHidden = true
            self.FaceButtonOut.isHidden = true
            
        }else if infoteam?.strFacebook == "" {
            
            
            self.faceOut.isHidden = true
            self.FaceButtonOut.isHidden = true
            
        }
        
        if infoteam?.strTwitter == nil {
            
            
            self.twitterOut.isHidden = true
            self.twitterButtonOut.isHidden = true
            
        }else if infoteam?.strTwitter == "" {
            
            self.twitterOut.isHidden = true
            self.twitterButtonOut.isHidden = true
            
        }
        
        
        if infoteam?.strInstagram == nil && infoteam?.strFacebook == nil && infoteam?.strTwitter == nil {
            self.viewnetwork.isHidden = true
        }else if infoteam?.strInstagram == "" && infoteam?.strFacebook == "" && infoteam?.strTwitter == "" {
            self.viewnetwork.isHidden = true
        }
        
        if infoteam?.strWebsite == nil && infoteam?.strInstagram == nil && infoteam?.strFacebook == nil && infoteam?.strTwitter == nil {
            self.networkStack.isHidden = true
            self.lineanetwork.isHidden = true
            
        } else if infoteam?.strWebsite == "" && infoteam?.strInstagram == "" && infoteam?.strFacebook == "" && infoteam?.strTwitter == "" {
            self.networkStack.isHidden = true
            self.lineanetwork.isHidden = true
        }
        
        
        //configuracion cornerradius en scroll
        self.scrollout.clipsToBounds = true
        self.scrollout.layer.cornerRadius = 20
        self.scrollout.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //configuracion button back corner radius
        self.viewButtonOut.layer.cornerRadius = self.viewButtonOut.frame.height / 2
        
        
        //configuracion collection view
        self.arrayImage = [infoteam?.strTeamFanart1 ?? "", infoteam?.strTeamFanart2 ?? "", infoteam?.strTeamFanart3 ?? ""]
        
        //se agrega reconocimiento de el gesto con la finalidad de poder cambiar entre imagenes y centrarlo
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeleft.direction = .left
        
        collection.addGestureRecognizer(swipeleft)
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swiperight.direction = .right
        
        collection.addGestureRecognizer(swiperight)
        self.collection.reloadData()
        
    }
    public func IrAlaDerecha() {
        //el auxrow funciona como limitante de las filas
        if Auxrow != 0 {
            
            Auxrow -= 1
            //gracias al scroll to item podemos movernos a la celda especifica
            self.collection.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    @objc func Gesture(gesture: UISwipeGestureRecognizer) -> Void{
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right{
            
            IrAlaDerecha()
            
        }else if gesture.direction == UISwipeGestureRecognizer.Direction.left{
            
            if Auxrow != (arrayImage.count - 1) {
                
                Auxrow += 1
                
                self.collection.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
                
                    }
                }
            }
    

}
