# lock screen stuffs:

    1. sudo pacman -S swaylock
    2. sudoedit /etc/systemd/system/suspend@.serivce
    3. paste this: 
`
[Unit]
Description=Travar tela antes de suspender para o usuario %i
Before=sleep.target

[Service]
User=%i
Type=forking
Environment=WAYLAND_DISPLAY=wayland-1
Environment=XDG_RUNTIME_DIR=/run/user/1001
ExecStart=/usr/bin/swaylock -f -i /home/filo/Images/ScreenShots/2026-04-24_02-04-12.png
ExecStartPost=/usr/bin/sleep 1
[Install]
WantedBy=sleep.target
`
    
    4. sudo systemctl enable suspend@filo.service
    5. sudo systemctl daemon-reload
    **Done** 
# OBs:
- might need to do id -u to get the id number above; 
- Path to image... or change -i for -c with color code


# Alternativa com função bash:

    **Em .bashrc:**
    # Função para suspender com bloqueio garantido`
            suspend() {
                # -f para rodar em background, permitindo que o sleep rode em seguida
                swaylock -f -i /home/filo/Images/ScreenShots/2026-04-24_02-04-12.png
                
                # Aguarda 1 segundo para garantir que o Sway renderizou o bloqueio
                sleep 1
                
                # Executa a suspensão
                systemctl suspend
            }
            `
