import os
import sys

def download_file(local_path, remote_path, username, password, ip):

    print("\n[*] Starting...")
    
    os.system(f"sshpass -p \"{password}\" scp -r {local_path} {username}@{ip}:{remote_path}")


    print(f"[+] Upload saved to \"{remote_path}\"")

if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: python download_file.py <local_path> <remote_path> <username> <password> <ip>")
        sys.exit(1)
    local_path = sys.argv[1]
    remote_path = sys.argv[2]
    username = sys.argv[3]
    password = sys.argv[4]
    ip = sys.argv[5]
    download_file(local_path, remote_path, username, password, ip)
