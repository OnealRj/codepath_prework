//
//  SettingsControllerViewController.swift
//  Prework
//
//  Created by Rj O'Neal on 1/3/22.
import UIKit
class SettingsController: UIViewController
{
    @IBOutlet weak var SuggestedTip1: UITextField!
    @IBOutlet weak var SuggestedTip2: UITextField!
    @IBOutlet weak var SuggestedTip3: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //grabbing default values from percentage keys
        let firstTip = UserDefaults.standard.double(forKey: "firstTip")
        let secondTip = UserDefaults.standard.double(forKey: "secondTip")
        let thirdTip = UserDefaults.standard.double(forKey: "thirdTip")
        SuggestedTip1.text = String(firstTip)
        SuggestedTip2.text = String( secondTip)
        SuggestedTip3.text = String(thirdTip)
    }
    @IBAction func switchToDarkMode(_ sender: UISwitch)
    {
        if #available(iOS 13, *)
        {
            let appDelegate = UIApplication.shared.windows.first
            if(sender.isOn)
            {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
        
    }
    @IBAction func onSubmitButton(_ sender: Any)
    {
        let Tip1 = SuggestedTip1.text
        let Tip2 = SuggestedTip2.text
        let Tip3 = SuggestedTip3.text
        UserDefaults.standard.set(Tip1, forKey: "firstTip")
        UserDefaults.standard.set(Tip2, forKey: "secondTip")
        UserDefaults.standard.set(Tip3, forKey: "thirdTip")
    }
    
}
