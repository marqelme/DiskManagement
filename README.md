# DiskManagement
Gather disk facts and select and manage a disk, its partitions and file systems.

The DiskManagement module exports two Cmdlets:

1. Get-DiskFacts (alias Get-DiskInfo)
2. Edit-Disk (alias Manage-Disk)

For a detailed documentation of this Cmdlets please read the help sections in DiskManagement.psm1.
Once the module is installed on your computer you can also display the help in PowerShell:

1. Get-Help Get-DiskFacts
2. Get-Help Edit-Disk

The module is also available on PowerShell Gallery:

[PowerShell Gallery](https://www.powershellgallery.com/packages/DiskManagement/1.4)

If you are using Ansible you can have a look at the corresponding Ansible modules of the Cmdlets:

[win_disk_facts](https://github.com/ansible/ansible/pull/32935)
[win_disk_management](https://github.com/ansible/ansible/pull/27634)
