import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var getUserButton: UIButton!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.isHidden = true
        cardView.layer.borderWidth = 2
        cardView.layer.borderColor = UIColor.darkGray.cgColor
        nameLabel.text = ""
        cityLabel.text = ""
        streetLabel.text = ""
        countryLabel.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    @IBAction func getUserAction(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 1828) { (user) in
            
            self.activityIndicator.stopAnimating()
            
            self.setup(user: user)
            
        } failure: { (error) in
            
            self.activityIndicator.stopAnimating()
            
            self.nameLabel.text = error.debugDescription
        }

    }
    
    private func setup(user: User) {
        cardView.isHidden = false
        nameLabel.text = "\(user.name?.title ?? "Mr."). \(user.name?.first ?? "Sebastián") \(user.name?.last ?? "Spadea")"
        cityLabel.text = "\(user.city ?? "CABA"), \(user.state ?? "Buenos Aires")"
        streetLabel.text = "\(user.location?.street?.number ?? 1234) \(user.location?.street?.name ?? "Bruselas")"
        countryLabel.text = user.country ?? "Argentina"
        imageCard.kf.setImage(with: URL(string: user.picture?.medium ?? "https://cdnlrv.lavoz.com.ar/img/user/default.jpg"))
    }
    
}

