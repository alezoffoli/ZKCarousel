//
//  ZKCarouselCell.swift
//  ZKCarousel
//
//  Created by Zachary Khan on 8/22/20.
//

public class ZKCarouselCell: UICollectionViewCell {
    
    // MARK: - Properties
    public var slide : ZKCarouselSlide? {
        didSet {
            guard let slide = slide else {
                print("ZKCarousel could not parse the slide you provided.")
                return
            }
            parseData(forSlide: slide)
        }
    }
    
    private lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var leftArrow : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var rightArrow : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Default Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    private func setup() {
        backgroundColor = .clear
        clipsToBounds = true
        
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 32).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    
        
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        contentView.addSubview(leftArrow)
        leftArrow.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        leftArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        leftArrow.widthAnchor.constraint(equalToConstant: 30).isActive = true
        leftArrow.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        contentView.addSubview(rightArrow)
        rightArrow.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        rightArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        rightArrow.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightArrow.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func parseData(forSlide slide: ZKCarouselSlide) {
        imageView.image = slide.image
        leftArrow.image = UIImage(named: "Arrow Left")
        rightArrow.image = UIImage(named: "Arrow Right")
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
    
    func updateArrows(isFirstItem: Bool, isLastItem: Bool) {
        leftArrow.isHidden = isFirstItem
        rightArrow.isHidden = isLastItem
    }

}
