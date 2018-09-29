import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Button": CeaserCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
