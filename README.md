# Backup Shellscript
A simple yet powerful & configurable backup solution in the form of a Bash shell script. Something simple to maintain and evolve. 

Among other functionalities, it allows to configure controlled behavior related to:
  - Paths on a system that require backup.
  - Destination storage/disk/path for the backups once done.
  - A retention policy, for backup clean-up.
  
## Backup configuration file format
Configuration file, pretty simple but must look like something like this:
``` 
program_name_you_like : path
``` 

A real configuration file could look similar to this one:
``` 
mydocs  : /home/user/documents
webdocs : /var/www/html
configs : /etc
``` 

## Implementation details
Ideally, this script should run fom the system scheduler, that is as a cron task. 

### Installation on the server/computer
Copy the file named "backup.sh" to the path __/usr/local/bin__. Most surely this is part of your $PATH variable, that defines from where executable files can be invoked. To ensure it is, simply verify the $PATH variable from a shell echoing it doing ```echo $PATH``` command on a terminal window. 

Once the file is copied to the destionation folder mentioned before, give the file execution permission by issuing ```chmod 755 /usr/local/bin/backup.sh``` from the same terminal window. 

Finally, add the following example lines to your crontab by doing this:

1. ```crontab -e``` 
2. Paste this following code at the bottom of the file. Then save & exit. 

```
0 5 * * * /usr/local/bin/backup.sh >/dev/null 2>&1
``` 

## Potential improvements
  - Encrypt backup files with an RSA key pair.
  - Use this shell script with automation tools like Ansible/Chef/Puppet/Salt/Terraform.
  - Include this shell script in the CI/CD development pipeline.
  - Use SCP or SFTP, subsystems of SSH, to move the backup files once created to a mountpoint not previously mounted.
  - Implement incremental backups.
  - Explore deduplication.
  - Improve potential error routines. 
