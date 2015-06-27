//  DetailViewController.swift
//  FinalProjectVer1
//
//  Created by Richard H Woolley on 6/22/15.
//  Copyright (c) 2015 Bright Quasar Software, R.Woolley.

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!          // These 3 outlets are to the storyboard detail view. 

  @IBOutlet weak var cameraMissingAlert: UILabel!  // this is now used to display a gaming message.

  var selectedPerson : Person!  // we know we will "initialize" this through helper func in viewDidLoad()

// -------------------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    let tupleOfFirstAndLastNames = setupTextFields(1)
    let imageWhichMatchesSelectedPerson =  tupleOfFirstAndLastNames.1 // Fun with overloading:]
    switch imageWhichMatchesSelectedPerson {
    case "Woolley":
      let imageOfme = UIImage(named: "me")
      self.imageView.image = imageOfme
    case "Tyson":
      let imageOfTyson = UIImage(named: "NeilTyson")
      self.imageView.image = imageOfTyson
    case "Sagan":
      let imageOfSagan = UIImage(named: "carlSagan")
      self.imageView.image = imageOfSagan
    case "Stenger":
      let imageOfVictorStenger = UIImage(named: "VictorStenger")
      self.imageView.image = imageOfVictorStenger
    case "Schrodinger":
      let imageOfErwinS = UIImage(named: "ErwinS")
      self.imageView.image = imageOfErwinS
    case "Crick":
      let imageOfFransisCrick = UIImage(named: "FransisCrick")
      self.imageView.image = imageOfFransisCrick
    case "Watson":
      let imageOfJamesWatson = UIImage(named: "JamesWatson")
      self.imageView.image = imageOfJamesWatson
    case "Dawkins":
      let imageOfRichardDawkins = UIImage(named: "RichardDawkins")
      self.imageView.image = imageOfRichardDawkins
    case "Feynman":
      let imageOfRichardFeynman = UIImage(named: "RichardFeynman")
      self.imageView.image = imageOfRichardFeynman
    case "Weinberg":
      let imageOfStevenWeinberg = UIImage(named: "StevenWeinberg")
      self.imageView.image = imageOfStevenWeinberg
    case "Asimov":
      var imageOfIsaacAsimov = UIImage(named: "IsaacAsimov")
      self.imageView.image = imageOfIsaacAsimov
    default:
      break
    }
    self.setupTextFields()
/*
    if lastNameTextField.text == "" && firstNameTextField.text == "" {


    } else {
      // leave the lastNameTextField "blank" with its place-holder text
    }
*/
  }


// Fun with overloading:]
  func setupTextFields(shortVer: Int) -> (String, String) {
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    return (self.selectedPerson.firstName, self.selectedPerson.lastName)
  }

  func setupTextFields() {
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    self.firstNameTextField.tag = 0
    self.lastNameTextField.tag = 1
    self.firstNameTextField.text = self.selectedPerson.firstName
    self.lastNameTextField.text = self.selectedPerson.lastName
    self.firstNameTextField.text = ""  // Because, I intend to make a guessing game in DetailViewController.
    self.lastNameTextField.text = ""
    self.cameraMissingAlert.textColor = UIColor.blueColor()
    self.cameraMissingAlert.text = "Guess this man's name"
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()  // dismiss keyboard
    return true // or false
  }


  func textFieldDidEndEditing(textField: UITextField) {  // Called by UITextFieldDelegate protocol.
    switch textField.tag {                          // Used the more-clear switch to asign per tags.
    case 0:
      self.selectedPerson.firstName = textField.text
    case 1:
      self.selectedPerson.lastName = textField.text
    default:
      break
    }
    //self.cameraMissingAlert.textColor = UIColor.blackColor()
      if self.lastNameTextField.text == "" && self.firstNameTextField.text == "" {
        println(self.selectedPerson.firstName)
        self.cameraMissingAlert.textColor = UIColor.greenColor()
        self.cameraMissingAlert.text = "You got it!"
      } else {
        self.cameraMissingAlert.textColor = UIColor.redColor()
        self.cameraMissingAlert.text = "Opps, try again"
      }
  }


  @IBAction func photoButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true

    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
/*
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    } else {  // Warn the user of the missing camera in both the sim and the really-old-iPod-touch
      self.cameraMissingAlert.text = "No camera found"
    }
*/
  }

  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject: AnyObject]) {
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage {  // added optional binding 
      self.imageView.image = image
      self.selectedPerson.image = image  // new, does this set the image in the table cell???
      picker.dismissViewControllerAnimated(true, completion: nil)
    }
  }

}
