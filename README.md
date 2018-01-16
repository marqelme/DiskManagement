# DiskManagement
## Description
Gather disk facts and select and manage a disk, its partitions and file systems.

## Cmdlets
The DiskManagement module exports two Cmdlets:

* Get-DiskFacts (alias Get-DiskInfo)
* Edit-Disk (alias Manage-Disk)

## Documentation
For a detailed documentation of this Cmdlets please read the help sections in DiskManagement.psm1.
Once the module is installed on your computer you can also display the help in PowerShell:

* Get-Help Get-DiskFacts
* Get-Help Edit-Disk

## Links
### PowerShell Gallery
[PowerShell Gallery](https://www.powershellgallery.com/packages/DiskManagement/1.4)

### Ansible
If you are using Ansible you can have a look at the corresponding Ansible modules of the Cmdlets:

* [win_disk_facts](https://github.com/ansible/ansible/pull/32935)
* [win_disk_management](https://github.com/ansible/ansible/pull/27634)
