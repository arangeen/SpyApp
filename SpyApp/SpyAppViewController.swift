import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher!

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
    }

    // We will talk about this method during lecture
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
    }

}

