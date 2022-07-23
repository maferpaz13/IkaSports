//
//  ViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import UIKit
import SDWebImage
import Alamofire
import NotificationBannerSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    
    //MARK: - Properties
    var ViewModel = DeportesViewModel()
    var ViewModel2 = LigasViewModel()
    var arrayDeportes : [(DeportesModel.Sports?)] = []
    var arrayDeportesOriginal : [(DeportesModel.Sports?)] = []
    var arrayLigas : [(LigasModel.Leagues?)] = []
    var vistaInfo: VistaInfo!
    var arrayligas :[(LigasModel.Leagues?)] = []
    var arrayligasSeleccionado :[(LigasModel.Leagues?)] = []
    var arrayligasSeleccionadoOriginal :[(LigasModel.Leagues?)] = []
    
    //MARK: - Constants

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DeportesCell", bundle: nil), forCellReuseIdentifier: "showDeportes")
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        hideKeyboardWhenTappedAround()
        ObtenerInfo()
        
    }
    
    @objc func CloseView(_ sender: UITapGestureRecognizer) {
        
        print("si entre aqui")
        hideViewInfo(vista: self)
        
    }
    
    @objc func OpenView(_ sender: UIButton) {
        
        let index = sender.tag
        let closeAction = UITapGestureRecognizer(target: self, action: #selector(CloseView))
        showViewInfo(vista: self, info: self.arrayDeportes[index]!.strSportDescription ?? "", titulo: self.arrayDeportes[index]!.strSport ?? "", closeAction: closeAction)
        
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
    //preparacion de liga seleccionada para mostrar en la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLigas" {
            let destinationVC = segue.destination as! LigasViewController
            destinationVC.arrayligasSeleccionado = arrayligasSeleccionado
            destinationVC.arrayligasSeleccionadoOriginal = arrayligasSeleccionadoOriginal
            }
        }
    //filtracion de ligas a partir de sus deportes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sprtfilter = arrayLigas.filter{$0!.strSport == arrayDeportes[indexPath.row]?.strSport}
        
        if sprtfilter.indices.contains(0) {
            
            arrayligasSeleccionado = sprtfilter
            arrayligasSeleccionadoOriginal = sprtfilter
            self.performSegue(withIdentifier: "showLigas", sender: nil)
           
        }else {
            
            NotificationBanner.init(title: "We're Sorry", subtitle: "There Aren't Leagues Available", style: .warning).show()
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
        cell.InfoButtonOut.tag = index
        cell.InfoButtonOut.addTarget(self, action: #selector(self.OpenView(_:)), for: .touchUpInside)
        //cell.selectionStyle = .none
       return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayDeportes.count
    }

    func ObtenerInfo() {
        showLoadingView(vista: self)
        ViewModel.getDeportes { (Result) in
            
            if let arraySport = (Result?.sports) {
                
                self.arrayDeportes = arraySport
                self.arrayDeportesOriginal = arraySport
                self.tableView.reloadData()
                }
        }
        
        ViewModel2.getLigas { (Result) in
            
            if let arrayLeagu = (Result?.leagues) {
                
                self.arrayLigas = arrayLeagu
                self.tableView.reloadData()
                HideLoadingView(vista: self)
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

