ansible nodes -m ping
ansible nodes -m command -a "df -hT"
command=$(ansible nodes -m command -a "yum list httpd" |& grep -i Installed -w | awk '{print $1}')
if [[ $command == "Installed" ]]
then
	ansible nodes -m yum -a "name=httpd state=absent"
fi
ansible nodes -m command -a "ls -ltrh /mnt/ansible"
