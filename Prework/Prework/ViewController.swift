//
//  ViewController.swift
//  Prework
//
//  Created by Rj O'Neal on 1/3/22.
//

import UIKit
class ViewController: UIViewController
{
    // Variables for the UILabels
    @IBOutlet weak var tipAmoutLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Tip Calculator"
        // Do any additional setup after loading the view.
        var initialized = UserDefaults.standard.bool(forKey: "defaults_initialized")
        if(initialized != nil)
        {initalizeValues()
        }
        initalizeNavigationItems()
    }
    private func initalizeValues()
    {
        //setting the intial percentages when the viewController intially loads
        let defaults = UserDefaults.standard
        defaults.set(15, forKey: "firstTip")
        defaults.set(18, forKey: "secondTip")
        defaults.set(20, forKey: "thirdTip")
        defaults.set(true, forKey: "defaults_initialized")
    }
    private func initalizeNavigationItems()
    {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(self.settingButtonAction))
    }
    @IBAction func calculateTip(sender: Any)
    {
        // initalize bill and
        //grabbing default values from percentage keys
        let firstTip = (UserDefaults.standard.double(forKey: "firstTip")) / 100
        let secondTip = (UserDefaults.standard.double(forKey: "secondTip")) / 100
        let thirdTip = (UserDefaults.standard.double(forKey: "thirdTip")) / 100
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [firstTip, secondTip, thirdTip]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmoutLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @objc func settingButtonAction()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let settingsController = storyBoard.instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
        self.navigationController?.pushViewController(settingsController, animated: true)
    }
}


