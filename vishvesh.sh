#!/bin/bash

# Create a script where the script takes one argument, and the value provided will be a user. Loop through each file in that user's home directory (ignore the sub directories) and if the file contains the line 'siteActive=true' then take every line from each of the files that starts with 'logPath=' and output it to /root/logPaths. Once completed, take a screenshot of the source code of the script, and of the script executing, to execute the script you will need to create your own sample input, please include the sample input as part of your execution screenshot.

# FUNCTION TO CHECK LINES
read_line()
{
        # CHECK IF IT HAS THIS STRING
        if grep -q siteActive=true "$vishvesh"; then
           echo $? # SomeString was found
        fi



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
                echo "read line function"
        done < $1
}

echo "Name of the user: $1"

for file in  /home/ *; do
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