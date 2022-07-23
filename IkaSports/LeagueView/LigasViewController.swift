//
//  LigasViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 22/07/22.
//

import UIKit

class LigasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func BackButton(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    //MARK: - Properties
  
    var arrayligasSeleccionado :[(LigasModel.Leagues?)] = []
    var arrayligasSeleccionadoOriginal :[(LigasModel.Leagues?)] = []
    
    //MARK: - Constants

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "LeaguesCell", bundle: nil), forCellReuseIdentifier: "Leagues")
        tableView.reloadData()
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        hideKeyboardWhenTappedAround()
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                BuscarNombre(nombre:Buscador.text!){
                    
                    (result) -> () in
                    
                    self.arrayligasSeleccionado.removeAll()
                    self.arrayligasSeleccionado = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(LigasModel.Leagues?)])->()){
            
            var local:[(LigasModel.Leagues?)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(arrayligasSeleccionadoOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in arrayligasSeleccionadoOriginal{
                    
                    var tag = ""
                    
                    if t?.strLeague != "" {
                        
                        tag = "\(t?.strLeague!)"
                        
                        
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
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "Leagues", for: indexPath) as! LeaguesTableViewCell
        cell.LeaguesLabel.text = arrayligasSeleccionado[index]?.strLeague!
        cell.shadowView.layer.cornerRadius = 8
        cell.shadowView.clipsToBounds = true
        cell.vistaContenedora.layer.cornerRadius = 8
        cell.vistaContenedora.clipsToBounds = true
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayligasSeleccionado.count
    }
    

}
