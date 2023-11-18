//
//  ViewController.swift
//  Assignment2
//
//  Created by Тимур Жексимбаев on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // text view for circle
    @IBOutlet weak var circle: UITextView!
    
    // text view for university name
    @IBOutlet weak var university: UITextView!
    
    // text view for city name
    @IBOutlet weak var city: UITextView!
    
    // small text above university name
    @IBOutlet weak var universityIdentifier: UITextView!
    
    // small text above city name
    @IBOutlet weak var cityIdentifier: UITextView!
    
    // button for alerting and changing city name
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var cityAlert: UIImageView!
    
    // name of user
    @IBOutlet weak var name: UITextView!

    // button for alerting and changing university name
    @IBOutlet weak var uniButton: UIButton!
    @IBOutlet weak var universityAlert: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // making circle
        circle.layer.cornerRadius = circle.layer.frame.size.width / 2
        
        // changing color of circle
        circle.backgroundColor = .lightGray
        
        //text of circle
        circle.text = "TM"
        
        // putting text in middle of circle
        circle.contentInset = UIEdgeInsets(top: (circle.bounds.size.height - circle.contentSize.height) / 2, left: 0, bottom: 0, right: 0)
        
        // university name
        university.text = "Saint Petersburg University of Information Technology, Optical Design and Engineering"
        // city name
        city.text = "Innopolis"
        
    
        // small texts above big texts
        universityIdentifier.text = "University"
        cityIdentifier.text = "City"
        
        // setting image of pen to button for university, and setting color
        uniButton.setImage(UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), for: .normal)
        
        uniButton.tintColor = .systemGray

        
        // setting image of pen to button for city, and setting color
        cityButton.setImage(UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), for: .normal)
        
        cityButton.tintColor = .systemGray
        
        
    }
    
    // function which throws alert in which u can change university name
    @IBAction func uniButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter new value", message: "", preferredStyle: .alert)
        
        // adding a text field where you can input text
        alertController.addTextField()
        
        // cancel button which cancels action, i.e. does nothing with university name
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        // done button changes university name
        let done = UIAlertAction(title: "Done", style: .default) {textFields in let answer = alertController.textFields![0].text
            
            // setting input text to university text
            self.university.text = answer?.description
            
        }
        
        // adding these actions
        alertController.addAction(cancel)
        alertController.addAction(done)
        
        // throws alert
        self.present(alertController, animated: true, completion: nil)
    }
    

    
    // function which throws alert in which u can change city name
    @IBAction func cityButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter new value", message: "", preferredStyle: .alert)
        
        // adding a text field where you can input text
        alertController.addTextField()

        // cancel button which cancels action, i.e. does nothing with city name
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        // done button changes city name
        let done = UIAlertAction(title: "Done", style: .default) {textFields in let answer = alertController.textFields?[0].text

            // setting input text to city text
            self.city.text = answer?.description

        }

        // adding these actions
        alertController.addAction(cancel)
        alertController.addAction(done)

        // throws alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    

}

