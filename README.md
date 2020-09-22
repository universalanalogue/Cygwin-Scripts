# Cygwin Scripts
Just a small collection of Cygwin scripts I use with Server 2019

# Requirements
1) Windows Server 2019

2) Cygwin

3) dos2unix (installed in Cygwin)

4) Dell OpenManage (for temp.sh)


# Installation
Just move the scripts into somewhere Cygwin is cognizant of them.
I keep the scripts on a share on the hypervisor and then utilize them though
Task manager for automation.

# Selection

1) backup.sh | This is my backup script.  It safely shuts down our VMs,
starts the windows backup, then restarts the server.

2) blog.sh | This logs the backup outcome to our log server, which is just
a share on the network.  It is triggered by Windows Task Manager, the log
triggers I use are documented in it.

3) size.sh | This logs the utilization of our drives to the log server.

4) temp.sh | This logs the intake temperature of our dell servers using omreport
every 2 hours, triggered by Task Manager.

# Todo

1) Pretty up the output for size.sh

# Credits

Dedicated to my co workers, who benefit from my scripting.
