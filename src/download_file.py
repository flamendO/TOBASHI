import os
import sys

def download_file(remote_path, username, password, ip, user):

    print("\n[*] Starting...")
    #os.chdir(f'..')
    current_directory = os.getcwd()
    print(current_directory)
    if os.path.exists('download_files'):
        os.chdir(f'download_files')
        if os.path.exists(f'{user}'):
            os.system(f'sshpass -p "{password}" scp {username}@{ip}:\'{remote_path}\' {user}/')
        
        else:
            os.system(f'mkdir {user}')
            os.chdir(f'..')
            os.system(f'sshpass -p "{password}" scp {username}@{ip}:\'{remote_path}\' {current_directory}/download_files/{user}')
    else:
        os.system(f'mkdir download_files')
        os.chdir(f'download_files')
        os.system(f'mkdir {user}')
        os.chdir(f'..')
        os.system(f'sshpass -p "{password}" scp {username}@{ip}:\'{remote_path}\' {current_directory}/download_files/{user}')


    

    print(f"[+] Download saved to \"{current_directory}/download_files/{user}\"")

if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: python download_file.py <remote_path> <username> <password> <ip> <user>")
        sys.exit(1)

    remote_path = sys.argv[1]
    username = sys.argv[2]
    password = sys.argv[3]
    ip = sys.argv[4]
    user = sys.argv[5]
    download_file(remote_path, username, password, ip, user)
