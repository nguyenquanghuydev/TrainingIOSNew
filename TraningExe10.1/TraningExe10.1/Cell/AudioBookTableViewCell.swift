
import UIKit
import Kingfisher
class AudioBookTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionName: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(collectionName: String, artistNameLabel: String, thumbnailName : String) {
        print(collectionName)
        self.collectionName.text = collectionName
        self.artistNameLabel.text = artistNameLabel
        print(thumbnailName)
        let url = URL(string: thumbnailName)
        self.thumbnailImage.kf.setImage(with: url)
    }
}
