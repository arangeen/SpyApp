import Foundation


/* extending Cipher protocol to include a decrypt method.
 *The decrypt method should take in an encrypted string and a secret and should
  return a plaintext string.
 *Once you update the Cipher protocol you will have to
  update the CesarCipher with a decrypt method.
 */

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    
    //meee
    func decode(_ plaintext: String, secret: String) -> String?
   
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    //meee
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBack = UInt32(secret) else{
            return nil
        }
        var decoded = ""
        
        for character in plaintext{
             let unicode = character.unicodeScalars.first!.value
             let shiftedUnicode = unicode - shiftBack
             let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
             decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
