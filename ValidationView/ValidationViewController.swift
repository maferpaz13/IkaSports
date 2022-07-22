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
                
        if let inicioOno = defaults.object(forKey: "Inicioono") as? Bool {
            
            self.performSegue(withIdentifier: "showMain", sender: nil)
            
            
        }else{
            
            self.performSegue(withIdentifier: "showOnBoarding", sender: nil)
            
            }
            
        }
        
    }

}
