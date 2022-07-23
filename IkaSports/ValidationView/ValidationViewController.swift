//
//  ValidationViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 22/07/22.
//

import UIKit

class ValidationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        validaciones()
    }
    
    func validaciones()  {
        
        DispatchQueue.main.async(){
        let defaults = UserDefaults.standard
            //Creacion de defaults para guardar dato de si el usuario inicio o no para mostrar el Main o el OnBoarding en su defecto
        if let inicioOno = defaults.object(forKey: "Inicioono") as? Bool {
            
            self.performSegue(withIdentifier: "showMain", sender: nil)
            
            
        }else{
            
            self.performSegue(withIdentifier: "showOnBoarding", sender: nil)
            
            }
            
        }
        
    }

}
