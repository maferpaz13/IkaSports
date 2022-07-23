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
    var liga : String = ""
    
    //MARK: - Constants

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "LeaguesCell", bundle: nil), forCellReuseIdentifier: "Leagues")
        tableView.reloadData()
        Buscador.delegate = self
        //Se agrega un addtarget al textfield para que llame la funcion cuando el campo se este editando
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
    
    //funcion encargada de filtrar el array de ligas con el uso de range
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(LigasModel.Leagues?)])->()){
            
            var local:[(LigasModel.Leagues?)] = []
            let busqueda = nombre.lowercased()
            
            if busqueda == "" || busqueda == " "{
                
                completion(arrayligasSeleccionadoOriginal)
                
            }else{
                
                for liga in arrayligasSeleccionadoOriginal{
                    
                    let nombre = liga?.strLeague ?? ""
                    
                    if nombre.lowercased().range(of:"\(busqueda)", options:[.caseInsensitive,.diacriticInsensitive]) != nil{
                        
                        local.append(liga)
                        
                    
                }
            }
                
                completion(local)
            }
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTeamss" {
            let destinationVC = segue.destination as! TeamsViewController
            destinationVC.liga = liga
            }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let haveLiga = arrayligasSeleccionado[indexPath.row]?.strLeague {
        liga = haveLiga
        }
        self.performSegue(withIdentifier: "showTeamss", sender: nil)
        
        return
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "Leagues", for: indexPath) as! LeaguesTableViewCell
        cell.LeaguesLabel.text = arrayligasSeleccionado[index]?.strLeague!
        cell.shadowView.layer.cornerRadius = 8
        cell.shadowView.clipsToBounds = true
        cell.vistaContenedora.layer.cornerRadius = 8
        cell.vistaContenedora.clipsToBounds = true
        cell.selectionStyle = .none
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayligasSeleccionado.count
    }
    

}
