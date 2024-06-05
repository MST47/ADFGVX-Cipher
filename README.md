# ADFGVX-Cipher

## Overview
This repository contains an implementation of the ADFGVX Cipher in MATLAB. The ADFGVX cipher is a field cipher used by the German Army during World War I. It is a combination of a modified Polybius square and a single columnar transposition. The implementation is divided into three main functions:
1. **Generation of 6x6 Polybius Square** using a given keyword.
2. **Encryption Function** to encrypt plaintext messages.
3. **Decryption Function** to decrypt ciphertext messages.

## Getting Started

### Prerequisites
To run the code, you need MATLAB installed on your machine. No additional toolboxes are required.

### Functions in the File Repository
- `create_polybius_square`: Function to generate a 6x6 Polybius square.
- `encrypt`: Function to encrypt a plaintext message.
- `decrypt`: Function to decrypt a ciphertext message.
- `README.md`: Documentation of the repository.

### Usage

1. **Generate Polybius Square**
    ```matlab
    polybius_square = create_polybius_square('yourkeyword');
    ```
    Replace `'yourkeyword'` with the keyword of your choice.

2. **Encrypt a Message**
    ```matlab
    ciphertext = encrypt('plaintext', 'yourkeyword', 'transpositionkey');
    ```
    Replace `'plaintext'` with the message you want to encrypt, `'yourkeyword'` with the keyword used for generating the Polybius square, and `'transpositionkey'` with the key for the columnar transposition.

3. **Decrypt a Message**
    ```matlab
    plaintext = decrypt('ciphertext', 'yourkeyword', 'transpositionkey');
    ```
    Replace `'ciphertext'` with the encrypted message, `'yourkeyword'` with the keyword used for generating the Polybius square, and `'transpositionkey'` with the key for the columnar transposition.

    ```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
This implementation is inspired by the historical ADFGVX cipher used during World War I. For more information, you can refer to [ADFGVX cipher on Wikipedia](https://en.wikipedia.org/wiki/ADFGVX_cipher).
