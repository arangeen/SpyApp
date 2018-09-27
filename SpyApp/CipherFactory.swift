import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
