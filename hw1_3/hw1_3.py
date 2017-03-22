
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

def file_write(data, filename):
    f = open(filename, 'wb')
    f.write(data)
    f.close()
    print("Stuff got saved")

def read_file(filename):

    try:
        f = open(filename ,'rb')
        file_content = f.read()
        f.close()
        print("Stuff got read")
        return file_content
    except:
        print('No such file exist with the name ',filename,' yet')
    

    

def main():

    while(True):
        choice = input("Do you wish to (d)ecrypt or (e)ncrypt")
        if(choice == 'e'):
            # initialization key
            key = Fernet.generate_key()

            # get the message from the user
            message = input('Enter message to encrypt:')

            # convert the message to binary format
            message_bytes = bytes(message, encoding="UTF-8")
            
            # encrypt some message
            ct = encrypt(key, message_bytes)
            file_write(ct, 'ct.txt')
            file_write(key, 'key.txt')

        elif(choice == 'd'):
            ct_filename = input('Enter the file name that has the crypted message')
            key_filename = input('Enter the file name that has the key')

            ct = read_file(ct_filename)
            key = read_file(key_filename)

            plain_message = decrypt(ct, key)

            print('Ciphertext: ',ct)
            print('Plain message: ',str(plain_message))
    

main()
