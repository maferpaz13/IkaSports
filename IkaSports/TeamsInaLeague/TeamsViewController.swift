//
//  TeamsViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import UIKit
import SDWebImage
import Foundation
import NotificationBannerSwift

class TeamsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource {
   
    

    //MARK: - IBOutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func BackButton(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    //MARK: - Properties
    var arrayTeams : [(TeamsModel.Teams?)] = []
    var arrayTeamsOriginal : [(TeamsModel.Teams?)] = []
    var ViewModel = TeamsViewModel()
    var liga : String = ""
    
    //MARK: - Constants

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TeamsCell", bundle: nil), forCellReuseIdentifier: "showTeam")
        Buscador.delegate = self
        //Se agrega un addtarget al textfield para que llame la funcion cuando el campo se este editando
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        hideKeyboardWhenTappedAround()
        ObtenerInfo()
        
    }
    
    func ObtenerInfo() {
        showLoadingView(vista: self)
        ViewModel.getTeams(liga: liga, parameters: TeamsStruct.init(league: liga)) { (Result) in
            
            if let arrayteam = (Result?.teams) {
                
                self.arrayTeams = arrayteam
                self.arrayTeamsOriginal = arrayteam
                self.tableView.reloadData()
                HideLoadingView(vista: self)
            }else{
                NotificationBanner.init(title: "We're Sorry", subtitle: "There are'nt Teams in this League", style: .warning).show()
                HideLoadingView(vista: self)
            }
        
        }

    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                BuscarNombre(nombre:Buscador.text!){
                    
                    (result) -> () in
                    
                    self.arrayTeams.removeAll()
                    self.arrayTeams = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    //funcion encargada de filtrar el array de ligas con el uso de range
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(TeamsModel.Teams?)])->()){
            
            var local:[(TeamsModel.Teams?)] = []
            let busqueda = nombre.lowercased()
            
            if busqueda == "" || busqueda == " "{
                
                completion(arrayTeamsOriginal)
                
            }else{
                
                for teams in arrayTeamsOriginal{
                    
                    let nombre = teams?.strTeam ?? ""
                    
                    if nombre.lowercased().range(of:"\(busqueda)", options:[.caseInsensitive,.diacriticInsensitive]) != nil{
                        
                        local.append(teams)
                        
                    
                }
            }
                
                completion(local)
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "showTeam", for: indexPath) as! TeamsTableViewCell
        let logoImage = URL(string:  arrayTeams[index]?.strTeamBadge ?? "")
        cell.TeamNameLabel.text = arrayTeams[index]?.strTeam!
        cell.EstadiumLabel.text = arrayTeams[index]?.strStadium ?? ""
        cell.contenedoraView.layer.borderWidth = 1
        cell.contenedoraView.layer.borderColor = UIColor.init(named: "gray")!.cgColor
        cell.contenedoraView.layer.cornerRadius = 8
        cell.contenedoraView.clipsToBounds = true
        cell.logoImage.sd_setImage(with: logoImage)
        cell.logoImage.layer.cornerRadius = 16
        cell.logoImage.clipsToBounds = true
        
        cell.selectionStyle = .none
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTeams.count
    }
}
