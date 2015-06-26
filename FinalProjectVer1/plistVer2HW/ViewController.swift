//  ViewController.swift
//  FinalProjectVer1
//
//  Created by Richard H Woolley on 6/22/15.
//  Copyright (c) 2015 Bright Quasar Software, R.Woolley.
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  var people = [Person]()
  var p = [Person]()  //   ----- TEMP TRICK ***********  see below  ***********************
  var myInfo = [String : Person]()

// ----------------------------------------------------------------------------


// I see no reason why the following two functions would not save and retrieve my images. 
// ... And yet, re-running the app the second time, after an un-install, leaves my cells sans images.
// The One line of code: self.people = peopleFromArchive -- ought to allow for the display of my images.

  override func viewDidLoad() {
    super.viewDidLoad()
      if let peopleFromArchive = self.loadFromArchive() {
        //self.p = peopleFromArchive    // ***** TEMP TRICK (satisfy protocol) here to get my images ****************
        self.people = peopleFromArchive  // Without this I get nothing, with it I am missing images. (this is the only stock line).
        //self.loadPeopleFromPlist()  // Added this trying to get back my images, only works if line above is missing, and trick used.
        self.saveToArchive()  // Trying to save my images.
      } else {
        self.loadPeopleFromPlist()    // *** These only run once, the first time after install, when Acchive is missing.
        self.saveToArchive()         // *** Both, stock lines.
      }
    self.tableView.dataSource = self  // ---- protocol uses this, but will compile and run without it -- non-functionally.
  }


// My images should definately be getting archived because they are definately in the people object, as seen below.
// Here we get our people data, by calling pathForResource on our bundle, casting it as an array of dictionaries ... and
//  parsing the array of dictionaries, and appending each person. Creating an object from data. **** Learn this well. ******
//                                                                                              ----------------------------
  private func loadPeopleFromPlist() {  //  **** This func simultaneoulsy obtains and asigns both names and images. **********
                                       //   ----------------------------------------------------------------------------------
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String: String]]  // chaining of optional bindings.
    { // <- Being clear where the above if let body begins *******.

      for object in peopleObjects {  // loop through the data from the plist (an array of dictionaries)
        /*if*/ let firstName = object["FirstName"], lastName = object["LastName"], image = object["image"] //{ // image not optional. 

        switch image! {
        case "me":
          var imageOfme = UIImage(named: "me")
          let person = Person(first: firstName!, last: lastName!, image: imageOfme!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "NeilTyson":
          var imageOfTyson = UIImage(named: "NeilTyson")
          let person = Person(first: firstName!, last: lastName!, image: imageOfTyson!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "carlSagan":
          var imageOfSagan = UIImage(named: "carlSagan")
          let person = Person(first: firstName!, last: lastName!, image: imageOfSagan!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "VictorStenger":
          var imageOfVictorStenger = UIImage(named: "VictorStenger")
          let person = Person(first: firstName!, last: lastName!, image: imageOfVictorStenger!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "ErwinS":
          var imageOfErwinS = UIImage(named: "ErwinS")
          let person = Person(first: firstName!, last: lastName!, image: imageOfErwinS!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "FransisCrick":
          var imageOfFransisCrick = UIImage(named: "FransisCrick")
          let person = Person(first: firstName!, last: lastName!, image: imageOfFransisCrick!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "JamesWatson":
          var imageOfJamesWatson = UIImage(named: "JamesWatson")
          let person = Person(first: firstName!, last: lastName!, image: imageOfJamesWatson!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "RichardDawkins":
          var imageOfRichardDawkins = UIImage(named: "RichardDawkins")
          let person = Person(first: firstName!, last: lastName!, image: imageOfRichardDawkins!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "RichardFeynman":
          var imageOfRichardFeynman = UIImage(named: "RichardFeynman")
          let person = Person(first: firstName!, last: lastName!, image: imageOfRichardFeynman!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "StevenWeinberg":
          var imageOfStevenWeinberg = UIImage(named: "StevenWeinberg")
          let person = Person(first: firstName!, last: lastName!, image: imageOfStevenWeinberg!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        case "IsaacAsimov":
          var imageOfIsaacAsimov = UIImage(named: "IsaacAsimov")
          let person = Person(first: firstName!, last: lastName!, image: imageOfIsaacAsimov!)  // create an instance of Person
          self.people.append(person)    // add that person to people (an instance var of type array of Persons
        default:
          break
        }
      }  // for loop
    }   // if let
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()  // Same-old short-version, finds datasource above via tableView protocol
                                // ... I have yet to get the longer more efficient version to work. 
                               // Mignt THAT version successfully load my images ??????????????????????
                              // ... those images which simply MUST be getting archived.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  // per protocol
    return self.people.count
  }
  // ^v^v^v tableView is an over-loaded func  --- per protocol.
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
      cell.backgroundColor = UIColor.whiteColor()  // 1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1
      cell.personImageView.layer.cornerRadius = 15
      cell.personImageView.layer.masksToBounds = true;
      cell.personImageView.layer.borderWidth = 2
      cell.personImageView.layer.borderColor = UIColor.blueColor().CGColor

      let personToDisplay = self.people[indexPath.row]
/*
      // With optional binding (will add it back in -- if/when I decide to make immage an optionl in Person.swift)
      /*if*/ let image = personToDisplay.image //{
        cell.personImageView.image = image           // Set the image on the cell ************* HERE IS MY (potential) A.H. 
      // One could do the same in one line of code (if we are playing hard-ball, as we are, in this version) e.g. :
*/  // Sans optional binding, and, on one line; 'cause that's how I roll.
      cell.personImageView.image = personToDisplay.image
      //}  // see above.

      cell.firstNameLabel.text = personToDisplay.firstName   // Set the names on the cell.
      cell.lastNameLabel.text = personToDisplay.lastName    // These "always" work.

      let userDefaults = NSUserDefaults.standardUserDefaults()  // "continued" below, userDefaults.objectForKey("LastSelected") ...

      cell.backgroundColor = UIColor.whiteColor() // --- re-set whiteColor -------------------------------------
        if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == personToDisplay.lastName
        {
          cell.backgroundColor = UIColor.lightGrayColor() // -- lightGrayColor -- HAD A FUNNY MINOR BUG -------------------- fixed ^^^^^^
        }
    return cell
  }


  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController,
         let myIndexPath = self.tableView.indexPathForSelectedRow(),
         let indexPath = self.tableView.indexPathForSelectedRow()
      {  // 3 chained if lets (mine is much better than the demo code)
         let selectedRow = indexPath.row
         let selectedPerson = self.people[selectedRow]
           //println(selectedPerson.firstName)
         detailViewController.selectedPerson = selectedPerson
         let userDefaults = NSUserDefaults.standardUserDefaults()
         userDefaults.setObject(selectedPerson.lastName, forKey: "LastSelected")  // BUG FIX, firstName was not unique.
         userDefaults.synchronize()
      }
    }
  }
/*  Sample code: (this is a mess of illogically nested ... stuff), the above is a better construct.
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {   // #1
        let myIndexPath = self.tableView.indexPathForSelectedRow()   // would be #2 (but is not itself conditioinal)
          if let indexPath = self.tableView.indexPathForSelectedRow() {     // #3 is meaningless, as it is nested.
            let selectedRow = indexPath.row
            let selectedPerson = self.people[selectedRow]
              println(selectedPerson.firstName)
            detailViewController.selectedPerson = selectedPerson
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(selectedPerson.firstName, forKey: "LastSelected")
            userDefaults.synchronize()
            // detailViewController.setupTextFields()  // From a previous version.
          } // ---------------------------------------------------------------------------^^^^^^^^^^^^ #1 ?????
      }
    }
  }
*/


  func saveToArchive() {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
        println(archivePath)
      NSKeyedArchiver.archiveRootObject(self.people, toFile: archivePath + "/archive")
    }
  }

/* // Brad's demo code: (contains a nested if let in the following func)
  func loadFromArchive() -> [Person]? {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        return peopleFromArchive
      }
    }
    return nil
  }
*/  // The following is a better construct. (by virtue of the use of chained optional bindings)
  func loadFromArchive() -> [Person]? {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String, peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person]
    {
      return peopleFromArchive
    }
    return nil
  }

}
