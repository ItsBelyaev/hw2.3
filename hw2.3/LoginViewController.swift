//
//  ViewController.swift
//  hw2.3
//
//  Created by Daniil Belyaev on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    let password = "123123"
    let username = "Daniil"
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.delegate = self
        passwordTF.delegate = self


    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          // Try to find next responder
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            view.endEditing(true)
        }
        return false
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if usernameTF.text == username, passwordTF.text == password {
            performSegue(withIdentifier: "goToInfo", sender: self)
        } else {
            showAlert(text: "Info is incorrect!")
        }
        
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotNameButtonPressed(_ sender: UIButton) {
        showAlert(text: "Your username is \(username)")
    }
    @IBAction func forgotPassButtonPressed(_ sender: UIButton) {
        showAlert(text: "Your password is \(password)")
    }
    func showAlert(text: String) {
        let alert = UIAlertController(title: "Hey", message: text, preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfo" {
            if let destinationVC = segue.destination as? InformationViewController {
                destinationVC.username = "Welcome, \(username)!"
            }
        }
    }
    
}

