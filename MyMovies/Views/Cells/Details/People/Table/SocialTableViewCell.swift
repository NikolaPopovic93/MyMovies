//
//  SocialTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/9/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {

    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var twitterImage: UIImageView!
    @IBOutlet weak var imdbImage: UIImageView!
    @IBOutlet weak var superView: UIView!
    
    @IBOutlet weak var facebookWidth: NSLayoutConstraint!
    @IBOutlet weak var instaWidth: NSLayoutConstraint!
    @IBOutlet weak var twitterWidth: NSLayoutConstraint!
    @IBOutlet weak var imdbWidth: NSLayoutConstraint!
    
    var social = ExternalIDs() {
        didSet {
            setGestures()
            setViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setViews() {
        let initWidth = superView.frame.width / 4
        
        facebookWidth.constant = initWidth
        instaWidth.constant = initWidth
        twitterWidth.constant = initWidth
        imdbWidth.constant = initWidth
        
        if !Utilities.isStringValid(social.facebookId) {
            facebookWidth.constant = CGFloat(0.0)
        }
        if !Utilities.isStringValid(social.instagramId) {
            instaWidth.constant = CGFloat(0.0)
        }
        if !Utilities.isStringValid(social.twitterId) {
            twitterWidth.constant = CGFloat(0.0)
        }
        if !Utilities.isStringValid(social.imdbId) {
            imdbWidth.constant = CGFloat(0.0)
        }
    }
    
    private func setGestures() {
        let tapGestureFacebook = UITapGestureRecognizer(target: self, action: #selector(facebookAction))
        self.facebookImage.addGestureRecognizer(tapGestureFacebook)
        self.facebookImage.isUserInteractionEnabled = true
        
        let tapGestureInsta = UITapGestureRecognizer(target: self, action: #selector(instaAction))
        self.instaImage.addGestureRecognizer(tapGestureInsta)
        self.instaImage.isUserInteractionEnabled = true
        
        let tapGestureTwitter = UITapGestureRecognizer(target: self, action: #selector(twitterAction))
        self.twitterImage.addGestureRecognizer(tapGestureTwitter)
        self.twitterImage.isUserInteractionEnabled = true
        
        let tapGestureImdb = UITapGestureRecognizer(target: self, action: #selector(imdbAction))
        self.imdbImage.addGestureRecognizer(tapGestureImdb)
        self.imdbImage.isUserInteractionEnabled = true
    }
    
    // MARK: - Actions
    @objc func facebookAction() {
        let absolutPath = String.init(format: facebook, social.facebookId)
        guard let url = URL(string: absolutPath) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc func instaAction() {
        let absolutPath = String.init(format: instagram, social.instagramId)
        guard let url = URL(string: absolutPath) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc func twitterAction() {
        let absolutPath = String.init(format: twitter, social.twitterId)
        guard let url = URL(string: absolutPath) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc func imdbAction() {
        let absolutPath = String.init(format: imdb, social.imdbId)
        guard let url = URL(string: absolutPath) else { return }
        UIApplication.shared.open(url)
    }
}

