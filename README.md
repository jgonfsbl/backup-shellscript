# Backup Shellscript
A simple yet powerful & configurable backup solution in the form of Bash shell script. Something simple to maintain and evolve. 

Among other functionalities, it ¡allows to configure behavior related to:
  - Paths on a system that require backup.
  - Destination storage/disk/path for the backups once done.
  - A retention policy, for backup clean-up.
  
## Backup configuration file format
Configuration file must look like something like this:
``` 
program_name_you_like : path
``` 

An example configuration file could look similar to this other:
``` 
mydocs  : /home/user/documents
webdocs : /var/www/html
configs : /etc
``` 

## Implementation details
Ideally, this script should run fom a cron task. Following in an example cron configuration that would run the script everyday at 5am:

### Installation on the server/computer
Copy the file named "backup.sh" to the path /usr/local/bin. Most surely this is part of your $PATH variable. To ensure it is, simply verify the $PATH variable from a shell using ```echo $PATH``` command on a terminal window. 

Once the file is copied to the destionation folder mentioned before, give the file execution permission by issuing ```chmod 755 /usr/local/bin/backup.sh``` from the same terminal window. 

Finally, add the following example like to your crontab by doing this:

1. ```crontab -e``` 
2. Paste this following code. Then save exit. 
```
0 5 * * * /usr/local/bin/backup.sh >/dev/null 2>&1
``` 
