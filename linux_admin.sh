#!/bin/bash

# Function to add a user
add_user() {
    read -p "Enter username to add: " username
    if id $username &> /dev/null
    then
       echo "$username user already present"
    else
       sudo useradd "$username"
       echo "User $username added."
    fi
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    echo "Are you sure to delete the user : Yes/No"
    read response
    if [[ $response=="Yes" ]]
    then
       sudo userdel "$username"
       echo "User $username deleted."
    else
       echo "User not deleted" 
    fi
}

# Function to list all users
list_users() {
    echo "Listing all users:"
    getent passwd | cut -d: -f1
}

# Function to add a group
add_group() {
    read -p "Enter group name to add: " groupname
    if id $groupname &> /dev/null
    then
       echo "$groupname group already present"
    else
       sudo groupadd "$groupname"
       echo "Group $groupname added."
    fi
}

# Function to delete a group
delete_group() {
    read -p "Enter group name to delete: " groupname
    sudo groupdel "$groupname"
    echo "Group $groupname deleted."
}

# Function to list all groups
list_groups() {
    echo "Listing all groups:"
    getent group | cut -d: -f1
}

# Main menu
while true; do
    echo "Choose an option:"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Add Group"
    echo "5. Delete Group"
    echo "6. List Groups"
    echo "7. Exit"
    read -p "Enter your choice [1-7]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) add_group ;;
        5) delete_group ;;
        6) list_groups ;;
        7) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
