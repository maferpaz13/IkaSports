//
//  ViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import UIKit
import SDWebImage
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    
    //MARK: - Properties
    var ViewModel = DeportesViewModel()
    var arrayDeportes : [(DeportesModel.Sports?)] = []
    var arrayDeportesOriginal : [(DeportesModel.Sports?)] = []
    
    //MARK: - Constants

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DeportesCell", bundle: nil), forCellReuseIdentifier: "showDeportes")
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        hideKeyboardWhenTappedAround()
        ObtenerInfo()
        
    }
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                BuscarNombre(nombre:Buscador.text!){
                    
                    (result) -> () in
                    
                    self.arrayDeportes.removeAll()
                    self.arrayDeportes = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(DeportesModel.Sports?)])->()){
            
            var local:[(DeportesModel.Sports?)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(arrayDeportesOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in arrayDeportesOriginal{
                    
                    var tag = ""
                    
                    if t?.strSport != "" {
                        
                        tag = "\(t?.strSport!)"
                        
                        
                    }else{
                            
                            tag = "N/A"
                            
                        }
                        
                    
                    if tag.lowercased().range(of:"\(cad)", options:[.caseInsensitive,.diacriticInsensitive]) != nil{
                        
                        local.append(t)
                        
                    
                }
            }
                
                completion(local)
            }
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "showDeportes", for: indexPath) as! DeportesTableViewCell
        let imageBackground = URL(string:  (arrayDeportes[index]?.strSportThumb)!)
        cell.SportLabel.text = arrayDeportes[index]?.strSport
        cell.BackgroundImage.sd_setImage(with: imageBackground)
        cell.BackGroundView.layer.cornerRadius = 8
        cell.BackGroundView.clipsToBounds = true
        cell.selectionStyle = .none
       return cell
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayDeportes.count
    }

    func ObtenerInfo() {
        
        ViewModel.getDeportes { (Result) in
            
            if let arraySport = (Result?.sports) {
                
                self.arrayDeportes = arraySport
                self.arrayDeportesOriginal = arraySport
                self.tableView.reloadData()
                
                }
        }
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}

@objc func dismissKeyboard() {
    view.endEditing(true)
}
}

