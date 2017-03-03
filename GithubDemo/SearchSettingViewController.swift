//
//  SearchSettingViewController.swift
//  GithubDemo
//
//  Created by Jake Vo on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit


protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}


class SearchSettingViewController: UIViewController {

    var settings: GithubRepoSearchSettings!
    weak var delegate: SettingsPresentingViewControllerDelegate?
    //var githubSetting: GithubRepoSearchSettings?
    //let selectedValue = 0
    @IBOutlet weak var currentVal: UILabel!
    @IBOutlet weak var sliderData: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
        print("gooooo")
        self.delegate?.didSaveSettings(settings: settings!)
        self.dismiss(animated: true, completion: nil);
    }
   
    
    @IBAction func onSlider(_ sender: Any) {
        
        
        let selectedValue = Int (sliderData.value)
        settings?.minStars = selectedValue
        currentVal.text = String (describing: selectedValue)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        
        delegate!.didCancelSettings()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
