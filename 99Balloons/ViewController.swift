import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    var balloons:[Balloon]=[]
    var currentIndex = -1
    let MAX_BALLOONS = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        self.incrementBy1()
        var currentBalloon = balloons[currentIndex]
        
        if currentIndex == 1 {
            balloonLabel.text = "\(currentBalloon.id) Balloon"
        }else{
            balloonLabel.text = "\(currentBalloon.id) Balloons"
        }
        balloonImage.image = UIImage(named: "\(currentBalloon.img)")
    }
    
    private func incrementBy1() {
        self.currentIndex++
        if self.currentIndex == self.balloons.count {
            self.currentIndex = 0
        }
    }
    
    private func randomBalloons() {
        var pictures = ["RedBalloon1.jpg","RedBalloon2.jpg","RedBalloon3.jpg","RedBalloon4.jpg"]
        
        for i in 1...MAX_BALLOONS {
            var randomIndex = Int(arc4random_uniform(UInt32(pictures.count)))
            var balloon = Balloon(img: pictures[randomIndex], id: i)
            self.balloons.append(balloon)
        }
    }
}

