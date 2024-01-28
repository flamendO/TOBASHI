def read_webhook_from_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
        if len(lines) >= 2:
            return lines[1].strip()
        else:
            return None

def update_initial_cmd_files(discord_webhook):
    files_to_modify = ['./src/initial_vps.cmd', './src/initial_local.cmd']

    for file_path in files_to_modify:
        with open(file_path, 'r') as file:
            content = file.read()

        content = content.replace('echo "WEBHOOK LINK"', f'echo "{discord_webhook}"')

        with open(file_path, 'w') as file:
            file.write(content)

if __name__ == "__main__":
    discord_txt_path = 'discord_config/discord.txt'

    webhook_from_file = read_webhook_from_file(discord_txt_path)

    if webhook_from_file:
        update_initial_cmd_files(webhook_from_file)
        print(f"Webhook updated successfully with: {webhook_from_file}")
    else:
        print("Failed to read webhook from file.")
