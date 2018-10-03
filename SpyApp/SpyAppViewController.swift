import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    //meeee connecting labeltwo
    @IBOutlet weak var outputTwo: UILabel!
    

    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }
    
    // meeee for output text to decrypt
    var outputTextToDecode: String {
        if let text = output.text{
            return text
        }else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
    }

    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    ///meeeee connected decode button
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            outputTwo.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decode(outputTextToDecode, secret: secretText){
            outputTwo.text = decoded
        }else {
            outputTwo.text = "Error decoding"
        }
        
    }
    
    
    
}

