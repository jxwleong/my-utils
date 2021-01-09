## Usage
### Command
1.  Permission is needed to run the bash script. Thus, `chmod +x <file>` is used to allow the script to be run. Where ```<file>``` is the script to be run.
    -    To set proxy, ```chmod +x set_proxy.sh```
    -    To unset proxy, ```chmod +x unset_proxy.sh```
2. Run the bash script.
   -    To set proxy, ```./set_proxy.sh```
   -    To unset proxy, ```./unset_proxy.sh```

### Example
```
user@user-VirtualBox:~/Desktop$ ./unset_proxy.sh
bash: ./unset_proxy.sh: Permission denied
user@user-VirtualBox:~/Desktop$ chmod +x unset_proxy.sh
user@user-VirtualBox:~/Desktop$ ./unset_proxy.sh
```
