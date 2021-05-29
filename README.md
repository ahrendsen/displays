# displays
This repository is used for configuring the digital display boards in Jorgensen Hall. They are Samsung TVs with embedded computer architecture which has Lubuntu 18.04 installed on each of them. These TVs display information to individuals who are in the department. It accomplishes this by downloading images from a cloud storage location and automatically starting a slideshow of those images. Once the operating system is installed and connected to the internet, follow the instructions below to configure the system to be a digital display board.

# Instructions 

Download git
    
    sudo apt install git

Download the repository that contains all the files for doing the setup.

    git clone https://github.com/ahrendsen/displays

Enter into the displays directory

    cd displays

Setup the root password

    sudo passwd
    
Run the setup script
    
    ./setupDisplay.sh

Follow the instructions that the setup script outputs.
