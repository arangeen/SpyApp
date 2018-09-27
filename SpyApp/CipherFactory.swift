import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "someOtherCipher": CeaserCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
