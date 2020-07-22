import UIKit
import AVKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "background", ofType: "mp4")!))
        
        let Layer = AVPlayerLayer(player: player)
        Layer.frame = self.view.frame
        Layer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(Layer)
        
        player.play(); player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self,
        selector: #selector(self.Repeater(snitch:)),
        name: .AVPlayerItemDidPlayToEndTime,
        object: player.currentItem)
    }
    @objc func Repeater(snitch: Notification) {
        let X: AVPlayerItem = snitch.object as! AVPlayerItem
        X.seek(to: .zero) { _ in }
    }
}
