#!/bin/bash

create_dir(){
   # Create directories 
   echo "Please enter the directory name : "
   read dir
   if [ -d "$dir" ]; then
      echo "Directory exists."
   else
      mkdir -p /home/ec2-user/$dir
      echo "$dir Directory created successfully."

   fi
}

set_permission(){
	# Set permissions
        echo "$(ls -ltr | grep ^d)"
        echo "Choose the directory from above list to change the persmisson"
	echo "Enter directory name"
	read dir
	#permissions=$(echo $line | awk '{print $1}')
	chmod 755 /home/ec2-user/$dir
	echo "Permissions set successfully."
}

disk_usage(){
	# Check disk usage of the directory
	du -sh /home/ec2-user/abc
}

check_available_disk(){
	# Check available disk space
	df -h
}



# Main menu
while true; do
    echo "Choose an option:"
    echo "1. Create directories"
    echo "2. Set permissions"
    echo "3. Check disk usage of the directory"
    echo "4. Check available disk space"
    echo "5. Exit"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1) create_dir;;
        2) set_permission ;;
        3) disk_usage;;
        4) check_available_disk ;;
        5) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

