
# import modulesas as required
import os
from cryptography.fernet import Fernet
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend



def encrypt(key, msg):
    
    # create Fernet object
    f1 = Fernet(key)
    f2 = Fernet(key)

    # generate ciphertext
    ciphertext = f1.encrypt(msg)

    original_msg = f2.decrypt(ciphertext)

    print("My Cypertext: ",ciphertext)
    print("My Original Msg: ",original_msg)

    # return the ciphertext to me
    return ciphertext


def decrypt(cipher_text, key):
    # create Fernet object
    f = Fernet(key)

    # decrypt the message
    message = f.decrypt(cipher_text)

    # return the message
    return message

def something():    
    choice = ''
    while choice != 0:
        choice = input('Do you want to encrypt or decrypt a message?/n Enter 1 to Encrypt or 2 to Decrypt or 0 to exit.')

        if choice == '1':
            message = input('Enter message to encrypt:')


        elif choice == '2':
            message = input('Enter message to decrypt:')

        elif choice == '0':
            print('Thanks!')


def main():
    # initialization key
    key = Fernet.generate_key()
    
    # get the message from the user
    message = input('Enter message to encrypt:')

    # convert the message to binary format
    message_bytes = bytes(message, encoding="UTF-8")
    
    # encrypt some message
    ct = encrypt(key, message_bytes)
    #print("The encrypted message: ", ct )

    # decrypt the message
    #print("The decrypted message: " , decrypt(key, ct))
    

main()
