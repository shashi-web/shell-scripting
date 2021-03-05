#!/bin/bash

# FUNCTION TO CHECK LINES
read_line()
{
        # CHECK IF IT HAS THIS STRING
        if [[ $line == *siteActive=true* ]]
        then
                # CHECK IF THE LINE STARTS WITH THEGIVEN STRING
                if [[ $(echo $line | cut -d'=' -f1) == "logPath" ]]
                then
                        # WRITE LINE TO LOGFILE
                        echo $line >> /root/logPaths
                fi
        fi
}

# FUNCTION TO READ LINES
read_file()
{
        # READ FILE LINE BY LINE FOR PATHS
        while IFS= read -r line
        do
                # CALL READ LINE FUNCTION FOR EACH LINE
                read_line $line
        done < $1
}

echo "Name of the user: $1"

for file in  /home/*; do
    if [ -f "$file" ]; then
	# READING PATH FILE LINE BY LINE
	for line in $(cat $file);
		do
        	# CALL READ FILE FUNCTION FOR EACH PATH
        	read_file $line
	done
    fi
done
echo "thanks"