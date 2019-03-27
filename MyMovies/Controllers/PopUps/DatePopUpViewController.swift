//
//  DatePopUpViewController.swift
//  MyMovies
//
//  Created by Apple on 3/27/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

protocol DatePopUpDelegate {
    func getDate(date : Date)
}

class DatePopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var setDateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePopUpDelegate?
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setViews()
    }
    
    private func setViews() {
        setDateButton.layer.cornerRadius = 15
        cancelButton.layer.cornerRadius = 15
        setDateButton.setShadow()
        cancelButton.setShadow()
        popUpView.layer.cornerRadius = 15
        datePicker.date = date
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setDateAction(_ sender: UIButton) {
        delegate?.getDate(date: datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
