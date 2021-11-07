//
//  RootController.swift
//  Emplea
//
//  Created by Егор Кожемин on 06.11.2021.
//

import UIKit
import PureLayout

class RootViewController: UIViewController {
    let scrollView  = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()
    
    lazy var topImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "home-top-image-svg")
        img.contentMode = .scaleAspectFit
        let imgHeght = view.frame.height / 2.2
        img.autoSetDimension(.height, toSize: imgHeght)
        return img
    }()
    
    lazy var titleLabelDefault: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 333, height: 120))
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0, green: 0.125, blue: 0.29, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Bold", size: 40)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.84
        label.attributedText = NSMutableAttributedString(
            string: "Creemos en ti\ncreemos en ustedes",
            attributes: [
                NSAttributedString.Key.kern: 1,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ])
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 339, height: 50)
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.467, green: 0.494, blue: 0.565, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Regular", size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.17
        label.attributedText = NSMutableAttributedString(string: "Que conecta a personas que ofrecen un servicio con otras que lo necesitan.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    lazy var bottomBtn: UIButton = {
        let btn = UIButton()
        btn.autoSetDimension(.width, toSize: 212.0)
        btn.autoSetDimension(.height, toSize: 66.0)
        
        btn.setTitle("Iniciar", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Sk-Modernist-Bold", size: 20)
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.layer.backgroundColor = UIColor(red: 0.178, green: 0.808, blue: 0.837, alpha: 1).cgColor
        btn.layer.cornerRadius = 10
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(presentProfessionalController), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        self.addSubviews()
        self.setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topImage)
        contentView.addSubview(titleLabelDefault)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(bottomBtn)
        view.setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        let widthLeftInset = 30.0
        scrollView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never // ignire safeare
        
        contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 40.0, left: 0, bottom: 0, right: 0))
        contentView.autoMatch(.width, to: .width, of: view)
        
        topImage.autoAlignAxis(toSuperviewAxis: .vertical)
        topImage.autoPinEdge(toSuperviewEdge: .top)
        
        titleLabelDefault.autoPinEdge(toSuperviewEdge: .left, withInset: widthLeftInset)
        titleLabelDefault.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        titleLabelDefault.autoPinEdge(.top, to: .bottom, of: topImage, withOffset: widthLeftInset)
        
        descriptionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 30.0)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabelDefault, withOffset: 10.0)
        
        bottomBtn.autoPinEdge(toSuperviewEdge: .left, withInset: widthLeftInset)
        bottomBtn.autoPinEdge(.top, to: .bottom, of: descriptionLabel, withOffset: 20)
        bottomBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20) // !
    }
    
    private func configureView() {
        self.view.backgroundColor = .white
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "home-bg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @objc
    private func presentProfessionalController(sender: UIButton) {
        sender.showAnimation {
            let professionalVC = ProfessionalViewController()
            //self.navigationController?.pushViewController(professionalVC, animated: true)
            
            professionalVC.modalPresentationStyle = .fullScreen
            professionalVC.modalTransitionStyle = .crossDissolve
            self.present(professionalVC, animated: true, completion: nil)
          }
    }
}
