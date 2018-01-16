function Get-DiskFacts {
        <#
        .SYNOPSIS
        Show the attached disks and disk information of the target host.
        requirements:
            - Windows 8.1 / Windows 2012R2 (NT 6.3) / PowerShell 4.0 or newer
            - Administrator privileges
        author:
            - Marc Tschapek (c5211773)
        license:
            - Copyright: (c) 2017, Marc Tschapek <marc.tschapek@itelligence.de>
            - BSD-2-Clause (see https://opensource.org/licenses/BSD-2-Clause)
        .DESCRIPTION
            - With this Cmdlet you can retrieve and output detailed information about the attached disks of the target and
               it's volumes and partitions if existent.
        .EXAMPLE
        Get-DiskFacts

        This example would give you the details of the disk and it's partitions and volumes.
        .EXAMPLE
        powershell -command "Get-DiskInfo"

        This example would give you the details of the disk and it's partitions and volumes.
        In this example the Cmdlet is started in a new PowerShell session. 
        This is useful if you want to invoke the Cmdlet from within cmd or another tool which is not a PowerShell host (for instance Oasis).
        .INPUTS
        None. You cannot pipe objects to Get-DiskFacts.
        .OUTPUTS
        System.String. Get-DiskFacts returns a string with a in JSON converted hashtable.
        The hashtable contains the following items and sub-items:

        - changed
            - Whether anything was changed.
            Returned: always
            Type: boolean
            Sample: true

        - message
            - Possible error message on failure.
            Returned: failed
            Type: string
            Sample: "No free drive letter left on the target"

        - total_disks:
            - Count of found disks on the target.
            Returned: if disks were found
            Type: int
            Sample: 3
        
        - disks:
            - Detailed information about one particular disk.
            Returned: if disks were found
            Type: list
            Contains:
                number:
                    - Disk number of the particular disk.
                    Returned: always
                    Type: int
                    Sample: 0
                size:
                    - Size in Gibibyte of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "100GiB"
                bus_type:
                    - Bus type of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "SCSI"
                friendly_name:
                    - Friendly name of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "Red Hat VirtIO SCSI Disk Device"
                partition_style:
                    - Partition style of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "MBR"
                partition_count:
                    - Number of partitions on the particular disk.
                    Returned: always
                    Type: int
                    Sample: 4
                operational_status:
                    - Operational status of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "Online"
                sector_size:
                    - Sector size in byte of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "512s/byte/bytes/"
                read_only:
                    - Read only status of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "true"
                bootable:
                    - Information whether the particular disk is a bootable disk.
                    Returned: always
                    Type: string
                    Sample: "false"
                system_disk:
                    - Information whether the particular disk is a system disk.
                    Returned: always
                    Type: string
                    Sample: "true"
                clustered:
                    - Information whether the particular disk is clustered (part of a failover cluster).
                    Returned: always
                    Type: string
                    Sample: "false"
                manufacturer:
                    - Manufacturer of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "Red Hat"
                model:
                    - Model specification of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "VirtIO"
                firmware_version:
                    - Firmware version of the particular disk.
                    Returned: always
                    Type: string
                    Sample: "0001"
                location:
                    - Location of the particular disk on the target.
                    Returned: always
                    Type: string
                    Sample: "PCIROOT(0)#PCI(0400)#SCSI(P00T00L00)"
                serial_number:
                    - Serial number of the particular disk on the target.
                    Returned: always
                    Type: string
                    Sample: "b62beac80c3645e5877f"
                unique_id:
                    - Unique ID of the particular disk on the target.
                    Returned: always
                    Type: string
                    Sample: "3141463431303031"
                guid:
                    - GUID of the particular disk on the target.
                    Returned: if existent
                    Type: string
                    Sample: "{efa5f928-57b9-47fc-ae3e-902e85fbe77f}"
                path:
                    - Path of the particular disk on the target.
                    Returned: always
                    Type: string
                    Sample: "\\\\?\\scsi#disk&ven_red_hat&prod_virtio#4&23208fd0&1&000000#{<id>}"
                partitions:
                    - Detailed information about one particular partition on the specified disk.
                    Returned: if existent
                    Type: list
                    Contains:
                        number:
                            - Number of the particular partition.
                            Returned: always
                            Type: int
                            Sample: 1
                        size:
                            - Size in Gibibyte of the particular partition.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "0.031GiB"
                        type:
                            - Type of the particular partition.
                            Returned: always
                            Type: string
                            Sample: "IFS"
                        gpt_type:
                            - gpt type of the particular partition.
                            Returned: if partition_style property of the particular disk has value "GPT"
                            Type: string
                            Sample: "{e3c9e316-0b5c-4db8-817d-f92df00215ae}"
                        no_default_driveletter:
                            - Information whether the particular partition has a default drive letter or not.
                            Returned: if partition_style property of the particular disk has value "GPT"
                            Type: string
                            Sample: "true"
                        mbr_type:
                            - mbr type of the particular partition.
                            Returned: if partition_style property of the particular disk has value "MBR"
                            Type: int
                            Sample: 7
                        active:
                            - Information whether the particular partition is an active partition or not.
                            Returned: if partition_style property of the particular disk has value "MBR"
                            Type: string
                            Sample: "true"
                        drive_letter:
                            - Drive letter of the particular partition.
                            Returned: if existent
                            Type: string
                            Sample: "C"
                        transition_state:
                            - Transition state of the particular partition.
                            Returned: always
                            Type: int
                            Sample: 1
                        offset:
                            - Offset of the particular partition.
                            Returned: always
                            Type: int
                            Sample: 368050176
                        hidden:
                            - Information whether the particular partition is hidden or not.
                            Returned: always
                            Type: string
                            Sample: "true"
                        shadow_copy:
                            - Information whether the particular partition is a shadow copy of another partition.
                            Returned: always
                            Type: string
                            Sample: "false"
                        guid:
                            - GUID of the particular partition.
                            Returned: if existent
                            Type: string
                            Sample: "{302e475c-6e64-4674-a8e2-2f1c7018bf97}"
                        access_paths:
                            - Access paths of the particular partition.
                            Returned: if existent
                            Type: string
                            Sample: "\\\\?\\Volume{85bdc4a8-f8eb-11e6-80fa-806e6f6e6963}\\"
                        volumes:
                            - Detailed information about one particular volume on the specified partition.
                            Returned: if existent
                            Type: list
                            Contains:
                                size:
                                    - Size in Gibibyte of the particular volume.
                                    - Accurate to three decimal places.
                                    Returned: always
                                    Type: string
                                    Sample: "0,342GiB"
                                size_remaining:
                                    - Remaining size in Gibibyte of the particular volume.
                                    - Accurate to three decimal places.
                                    Returned: always
                                    Type: string
                                    Sample: "0,146GiB"
                                type:
                                    - File system type of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "NTFS"
                                label:
                                    - File system label of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "System Reserved"
                                health_status:
                                    - Health status of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "Healthy"
                                drive_type:
                                    - Drive type of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "Fixed"
                                allocation_unit_size:
                                    - Allocation unit size in kb of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "64kb"
                                object_id:
                                    - Object ID of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "\\\\?\\Volume{85bdc4a9-f8eb-11e6-80fa-806e6f6e6963}\\"
                                path:
                                    - Path of the particular volume.
                                    Returned: always
                                    Type: string
                                    Sample: "\\\\?\\Volume{85bdc4a9-f8eb-11e6-80fa-806e6f6e6963}\\"
                physical_disk:
                    - Detailed information about physical disk properties of the particular disk.
                    Returned: if existent
                    Type: complex
                    Contains:
                        media_type:
                            - Media type of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "UnSpecified"
                        size:
                            - Size in Gibibyte of the particular physical disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "200GiB"
                        allocated_size:
                            - Allocated size in Gibibyte of the particular physical disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "100GiB"
                        device_id:
                            - Device ID of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "0"
                        friendly_name:
                            - Friendly name of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "PhysicalDisk0"
                        operational_status:
                            - Operational status of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "OK"
                        health_status:
                            - Health status of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "Healthy"
                        bus_type:
                            - Bus type of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "SCSI"
                        usage_type:
                            - Usage type of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "Auto-Select"
                        supported_usages:
                            - Supported usage types of the particular physical disk.
                            Returned: always
                            Type: complex
                            Contains:
                                Count:
                                    - Count of supported usage types.
                                    Returned: always
                                    Type: int
                                    Sample: 5
                                value:
                                    - List of supported usage types.
                                    Returned: always
                                    Type: string
                                    Sample: "Auto-Select, Hot Spare"
                        spindle_speed:
                            - Spindle speed in rpm of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "4294967295rpm"
                        physical_location:
                            - Physical location of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "Integrated : Adapter 3 : Port 0 : Target 0 : LUN 0"
                        manufacturer:
                            - Manufacturer of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "SUSE"
                        model:
                            - Model of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "Xen Block"
                        can_pool:
                            - Information whether the particular physical disk can be added to a storage pool.
                            Returned: always
                            Type: string
                            Sample: "false"
                        cannot_pool_reason:
                            - Information why the particular physical disk can not be added to a storage pool.
                            Returned: if can_pool property has value false
                            Type: string
                            Sample: "Insufficient Capacity"
                        indication_enabled:
                            - Information whether indication is enabled for the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "True"
                        partial:
                            - Information whether the particular physical disk is partial.
                            Returned: always
                            Type: string
                            Sample: "False"
                        serial_number:
                            - Serial number of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "b62beac80c3645e5877f"
                        object_id:
                            - Object ID of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: '{1}\\\\HOST\\root/Microsoft/Windows/Storage/Providers_v2\\SPACES_PhysicalDisk.ObjectId=\"{<object_id>}:PD:{<pd>}\"'
                        unique_id:
                            - Unique ID of the particular physical disk.
                            Returned: always
                            Type: string
                            Sample: "3141463431303031"
                virtual_disk:
                    - Detailed information about virtual disk properties of the particular disk.
                    Returned: if existent
                    Type: complex
                    Contains:
                        size:
                            - Size in Gibibyte of the particular virtual disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "300GiB"
                        allocated_size:
                            - Allocated size in Gibibyte of the particular virtual disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "100GiB"
                        footprint_on_pool:
                            - Footprint on pool in Gibibyte of the particular virtual disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "100GiB"
                        name:
                            - Name of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "vDisk1"
                        friendly_name:
                            - Friendly name of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Prod2 Virtual Disk"
                        operational_status:
                            - Operational status of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "OK"
                        health_status:
                            - Health status of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Healthy"
                        provisioning_type:
                            - Provisioning type of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Thin"
                        allocation_unit_size:
                            - Allocation unit size in kb of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "4kb"
                        media_type:
                            - Media type of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Unspecified"
                        parity_layout:
                            - Parity layout of the particular virtual disk.
                            Returned: if existent
                            Type: int
                            Sample: 1
                        access:
                            - Access of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Read/Write"
                        detached_reason:
                            - Detached reason of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "None"
                        write_cache_size:
                            - Write cache size in byte of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "100s/byte/bytes/"
                        fault_domain_awareness:
                            - Fault domain awareness of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "PhysicalDisk"
                        inter_leave:
                            - Inter leave in kb of the particular virtual disk.
                            - Accurate to three decimal places.
                            Returned: always
                            Type: string
                            Sample: "100kb"
                        deduplication_enabled:
                            - Information whether deduplication is enabled for the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "True"
                        enclosure_aware:
                            - Information whether the particular virtual disk is enclosure aware.
                            Returned: always
                            Type: string
                            Sample: "False"
                        manual_attach:
                            - Information whether the particular virtual disk is manual attached.
                            Returned: always
                            Type: string
                            Sample: "True"
                        snapshot:
                            - Information whether the particular virtual disk is a snapshot.
                            Returned: always
                            Type: string
                            Sample: "False"
                        tiered:
                            - Information whether the particular virtual disk is tiered.
                            Returned: always
                            Type: string
                            Sample: "True"
                        physical_sector_size:
                            - Physical sector size in kb of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "4kb"
                        logical_sector_size:
                            - Logical sector size in byte of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "512s/byte/bytes/"
                        available_copies:
                            - Number of the available copies of the particular virtual disk.
                            Returned: if existent
                            Type: int
                            Sample: 1
                        columns:
                            - Number of the columns of the particular virtual disk.
                            Returned: always
                            Type: int
                            Sample: 2
                        groups:
                            - Number of the groups of the particular virtual disk.
                            Returned: always
                            Type: int
                            Sample: 1
                        physical_disk_redundancy:
                            - Type of the physical disk redundancy of the particular virtual disk.
                            Returned: always
                            Type: int
                            Sample: 1
                        read_cache_size:
                            - Read cache size in byte of the particular virtual disk.
                            Returned: always
                            Type: int
                            Sample: 0
                        request_no_spof:
                            - Information whether the particular virtual disk requests no single point of failure.
                            Returned: always
                            Type: string
                            Sample: "True"
                        resiliency_setting_name:
                            - Type of the physical disk redundancy of the particular virtual disk.
                            Returned: always
                            Type: int
                            Sample: 1
                        object_id:
                            - Object ID of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: '{1}\\\\HOST\\root/Microsoft/Windows/Storage/Providers_v2\\SPACES_VirtualDisk.ObjectId=\"{<object_id>}:VD:{<vd>}\"'
                        unique_id:
                            - Unique ID of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "260542E4C6B01D47A8FA7630FD90FFDE"
                        unique_id_format:
                            - Unique ID format of the particular virtual disk.
                            Returned: always
                            Type: string
                            Sample: "Vendor Specific"
        .NOTES
          - If you invoke the Cmdlet all common parameters are available but no parameter will take an affect.
          - Of course you can use the common parameter -OutVariable.
          - In order to understand all the returned properties and values please visit the following site and open the respective MSFT class
            U(https://msdn.microsoft.com/en-us/library/windows/desktop/hh830612.aspx)
        .LINK
        Ansible Version: https://github.com/ansible/ansible/pull/32935
        .LINK
        Get-Disk
        Get-Volume
        Get-Partition
        Get-PhysicalDisk
        Get-VirtualDisk
        #>
        [CmdletBinding()
        ]
        param()

        Process {
            # Create a new result object
            $result = @{
                changed = $false
                total_disks = 0
                disks = @()
            }

            # Functions 
            function Test-Admin {
                    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
                    $IsAdmin = $CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

                    return $IsAdmin
            }

            # Check admin rights
            if (-not (Test-Admin)) {
                $result.message = "Cmdlet was not started with elevated rights"
	            $result.failed = "true"
                $result.Remove("total_disks")
                $result.Remove("disks")
                return $result | ConvertTo-Json
            }

            # Search disks
            try {
                $disks = Get-Disk
            } catch {
                $result.message = "Failed to search the disks on the target: $($_.Exception.Message)"
	            $result.failed = "true"
                return $result | ConvertTo-Json
            }
            [int32]$diskcount = $disks | Measure-Object | Select-Object  -ExpandProperty Count
            $result.total_disks = $diskcount
            foreach ($disk in $disks) {
                $disk_info = @{}
                $pdisk = Get-PhysicalDisk -ErrorAction SilentlyContinue | Where-Object {
                    $_.DeviceId -eq $disk.Number
                }
                if ($pdisk) {
                    $disk_info["physical_disk"] += @{
                        size = "$($pSize = "{0:N3}" -f ($pdisk.Size / 1GB))$($pSize)GiB"
                        allocated_size = "$($pAllocSize = "{0:N3}" -f ($pdisk.AllocatedSize / 1GB))$($pAllocSize)GiB"
                        device_id = $pdisk.DeviceId
                        friendly_name = $pdisk.FriendlyName
                        operational_status = $pdisk.OperationalStatus
                        health_status = $pdisk.HealthStatus
                        bus_type = $pdisk.BusType
                        usage_type = $pdisk.Usage
                        supported_usages = $pdisk.SupportedUsages
                        spindle_speed = "$($pdisk.SpindleSpeed)rpm"
                        firmware_version = $pdisk.FirmwareVersion
                        physical_location = $pdisk.PhysicalLocation
                        manufacturer = $pdisk.Manufacturer
                        model = $pdisk.Model
                        can_pool = $pdisk.CanPool
                        indication_enabled = $pdisk.IsIndicationEnabled
                        partial = $pdisk.IsPartial
                        serial_number = $pdisk.SerialNumber
                        object_id = $pdisk.ObjectId
                        unique_id = $pdisk.UniqueId
                    }
                    if ([single]"$([System.Environment]::OSVersion.Version.Major).$([System.Environment]::OSVersion.Version.Minor)" -ge 6.3) {
                        $disk_info.physical_disk.media_type = $pdisk.MediaType
                    }
                    if (-not $pdisk.CanPool) {
                        $disk_info.physical_disk.cannot_pool_reason = $pdisk.CannotPoolReason
                    }   
                    $vdisk = Get-VirtualDisk -PhysicalDisk $pdisk -ErrorAction SilentlyContinue
                    if ($vdisk) {
                        $disk_info["virtual_disk"] += @{
                            size = "$($vDSize = "{0:N3}" -f ($vdisk.Size / 1GB))$($vDSize)GiB"
                            allocated_size = "$($vDAllocSize = "{0:N3}" -f ($vdisk.AllocatedSize / 1GB))$($vDAllocSize)GiB"
                            footprint_on_pool = "$($vDPrint = "{0:N3}" -f ($vdisk.FootprintOnPool / 1GB))$($vDPrint)GiB"
                            name = $vdisk.name
                            friendly_name = $vdisk.FriendlyName
                            operational_status = $vdisk.OperationalStatus
                            health_status = $vdisk.HealthStatus
                            provisioning_type = $vdisk.ProvisioningType
                            allocation_unit_size = "$($vdisk.AllocationUnitSize / 1KB)kb"
                            media_type = $vdisk.MediaType
                            parity_layout = $vdisk.ParityLayout
                            access = $vdisk.Access
                            detached_reason = $vdisk.DetachedReason
                            write_cache_size = "$($vdisk.WriteCacheSize)s/byte/bytes/"
                            fault_domain_awareness = $vdisk.FaultDomainAwareness
                            inter_leave = "$($vDLeave = "{0:N3}" -f ($vdisk.InterLeave / 1KB))$($vDLeave)kb"
                            deduplication_enabled = $vdisk.IsDeduplicationEnabled
                            enclosure_aware = $vdisk.IsEnclosureAware
                            manual_attach = $vdisk.IsManualAttach
                            snapshot = $vdisk.IsSnapshot
                            tiered = $vdisk.IsTiered
                            physical_sector_size = "$($vdisk.PhysicalSectorSize / 1KB)kb"
                            logical_sector_size = "$($vdisk.LogicalSectorSize)s/byte/bytes/"
                            available_copies = $vdisk.NumberOfAvailableCopies
                            columns = $vdisk.NumberOfColumns
                            groups = $vdisk.NumberOfGroups
                            physical_disk_redundancy = $vdisk.PhysicalDiskRedundancy
                            read_cache_size = $vdisk.ReadCacheSize
                            request_no_spof = $vdisk.RequestNoSinglePointOfFailure
                            resiliency_setting_name = $vdisk.ResiliencySettingName
                            object_id = $vdisk.ObjectId
                            unique_id_format = $vdisk.UniqueIdFormat
                            unique_id = $vdisk.UniqueId
                        }
                    }
                }
                $disk_info.number = $disk.Number
                $disk_info.size = "$($disk.Size / 1GB)GiB"
                $disk_info.bus_type = $disk.BusType
                $disk_info.friendly_name = $disk.FriendlyName
                $disk_info.partition_style = $disk.PartitionStyle
                $disk_info.partition_count = $disk.NumberOfPartitions
                $disk_info.operational_status = $disk.OperationalStatus
                $disk_info.sector_size = "$($disk.PhysicalSectorSize)s/byte/bytes/"
                $disk_info.read_only = $disk.IsReadOnly
                $disk_info.bootable = $disk.IsBoot
                $disk_info.system_disk = $disk.IsSystem
                $disk_info.clustered = $disk.IsClustered
                $disk_info.manufacturer = $disk.Manufacturer
                $disk_info.model = $disk.Model
                $disk_info.firmware_version = $disk.FirmwareVersion
                $disk_info.location = $disk.Location
                $disk_info.serial_number = $disk.SerialNumber
                $disk_info.unique_id = $disk.UniqueId
                $disk_info.guid = $disk.Guid
                $disk_info.path = $disk.Path
                $parts = Get-Partition -DiskNumber $($disk.Number) -ErrorAction SilentlyContinue
                if ($parts) {
                    $disk_info["partitions"]  += @()
                    foreach ($part in $parts) {
                        $partition_info  = @{
                            number = $part.PartitionNumber
                            size = "$($pSize = "{0:N3}" -f ($part.Size /1GB))$($pSize)GiB"
                            type = $part.Type
                            drive_letter = $part.DriveLetter
                            transition_state = $part.TransitionState
                            offset = $part.Offset             
                            hidden = $part.IsHidden
                            shadow_copy = $part.IsShadowCopy
                            guid = $part.Guid
                            access_paths = $part.AccessPaths
                        }
                        if ($disks.PartitionStyle -eq "GPT") {
                            $partition_info.gpt_type = $part.GptType
                            $partition_info.no_default_driveletter = $part.NoDefaultDriveLetter
                        } elseif ($disks.PartitionStyle -eq "MBR") {
                            $partition_info.mbr_type = $part.MbrType
                            $partition_info.active = $part.IsActive
                        }
                        $vols = Get-Volume -Partition $part -ErrorAction SilentlyContinue
                        if ($vols) {
                            $partition_info["volumes"]  += @()
                            foreach ($vol in $vols) {
                                $volume_info  = @{
                                    size = "$($vSize = "{0:N3}" -f ($vol.Size / 1GB))$($vSize)GiB"
                                    size_remaining = "$($vSizeRe = "{0:N3}" -f ($vol.SizeRemaining / 1GB))$($vSizeRe)GiB"
                                    type = $vol.FileSystem
                                    label = $vol.FileSystemLabel
                                    health_status = $vol.HealthStatus
                                    drive_type = $vol.DriveType
                                    object_id = $vol.ObjectId
                                    path = $vol.Path
                                }
                                if ([System.Environment]::OSVersion.Version.Major -ge 10) {
                                    $volume_info.allocation_unit_size = "$($vol.AllocationUnitSize /1KB)kb"
                                } else {
                                    $volPath = ($vol.Path.TrimStart("\\?\")).TrimEnd("\")
                                    $BlockSize = (Get-CimInstance -Query "SELECT BlockSize FROM Win32_Volume WHERE DeviceID like '%$volPath%'" -ErrorAction SilentlyContinue | Select-Object BlockSize).BlockSize
                                    $volume_info.allocation_unit_size = "$($BlockSize / 1KB)kb"
                                }
                                $partition_info.volumes  += $volume_info
                            }
                        }
                    $disk_info.partitions += $partition_info
                    }
                }
                $result.disks += $disk_info
            }

            # Return result
            $result.message = "Cmdlet finished successfully"
            return $result | ConvertTo-Json -Depth 6
        }

}

function Edit-Disk {
        <#
        .SYNOPSIS
        This Cmdlet will avoid the manual setup of a disk which was attached via Tic to a target.
        requirements:
            - Windows 8.1 / Windows 2012R2 (NT 6.3) / PowerShell 4.0 or newer
            - Administrator privileges
        author:
            - Marc Tschapek (c5211773)
        license:
            - Copyright: (c) 2017, Marc Tschapek <marc.tschapek@itelligence.de>
            - BSD-2-Clause (see https://opensource.org/licenses/BSD-2-Clause)
        .DESCRIPTION
           - Select and manage a disk, its partitions and file systems
           - The alias for Edit-Disk which you can also use is Manage-Disk

        DYNAMIC PARAMETERS
        - SetDriveLetter
                - Manage disk parameter.
                - Drive letter which will be set for the partition on selected disk.
                - This dynamic parameter let's you browse through all available drive letters
                  on the target directly (with Tab key) if you set -SetDriveLetter while invoking the Cmdlet.
                - If you pass a drive letter to the Cmdlet which was chosen by your own (without Tab key to get
                  the free drive letters automatically) the Cmdlet will use this drive letter if it is a free drive
                  letter on the target. If the passed drive letter is not a free drive letter on the target,
                  the Cmdlet will be canceled.
                - If no SetDriveLetter parameter value was passed but a valid value for parameter SetPartitionAccessPath
                  was passed to the Cmdlet, the Cmdlet will create this partition access path
                  and no drive letter for the partition on selected disk.
                - If no SetDriveLetter parameter value and no value for parameter SetPartitionAccessPath
                  was passed to the Cmdlet, the Cmdlet will set a free drive letter for the partition randomly
                  and no partition access path on selected disk. If in this case no free drive lettter is left on the target
                  the Cmdlet will be canceled.
                - If a valid value for SetDriveLetter and for SetPartitionAccessPath parameter was passed to the Cmdlet,
                  the Cmdlet will setup this partition drive letter and access path on selected disk.
        - SetLargerFRS
                - Manage disk parameter.
                - Switch to set Large FRS parameter for file system on selected disk, solely settable for ntfs file system.
                - This switch depends on the SetFileSystem parameter and can only passed to the Cmdlet
                  if SetFileSystem parameter has value "ntfs".
        - SetShortNames
                - Manage disk parameter.
                - Switch to set Short Names parameter for file system on selected disk, solely settable for ntfs file system.
                - This switch depends on the SetFileSystem parameter and can only passed to the Cmdlet
                  if SetFileSystem parameter has value "ntfs".
        - SetIntegrityStreams
                - Manage disk parameter.
                - Switch to set Integrity Streams parameter for file system on selected disk, solely settable 
                  for refs file system.
                - This switch depends on the SetFileSystem parameter and can only passed to the Cmdlet
                  if SetFileSystem parameter has value "refs".
        .PARAMETER GetSize
        - Select disk parameter.
        - Size of the disk in gigabyte which will be selected.
        - If a size is passed the Cmdlet will try to select the disk with this size.
        - GetSize value must be equal or greater than 1GiB and maximum 18446744073709551615GiB.
        .PARAMETER GetPartitionStyle
        - Select disk parameter.
        - Partition style of the disk which will be selected.
        .PARAMETER GetOperationalStatus
        - Select disk parameter.
        - Operational Status of the disk which will be selected.
        .PARAMETER IsNotReadOnly
        - Select disk parameter.
        - Default behavior of the Cmdlet is, that the disk which will be selected 
          has to be in read-only status.
        - With this switch you can specify that the disk which will be selected 
          is not in read-only status (disk is writeable).
        .PARAMETER GetNumber
        - Select disk parameter.
        - Number of the disk which will be selected.
        - If a number is passed the Cmdlet will try to select the disk with this number.
        - Passed value will be checked in the beginning of the Cmdlet whether it is an int32 value.
        - If it is of type int64 the Cmdlet will be canceled.
        .PARAMETER SetPartitionStyle
        - Manage disk parameter.
        - Partition style which will be set on selected disk.
        .PARAMETER SetPartitionAccessPath
        - Manage disk parameter.
        - Access path which will be set on partition of selected disk.
        - The Cmdlet validates whether the passed value is already in use as access path by another disk,
          is a proper path/directory/folder on the target, is already in use as a link
          and whether it is empty (no files or folders inside).
        - This parameter has some dependencies with the dynamic parameter SetDriveLetter.
          For more information read the DYNAMIC PARAMETERS part of the help section.
        .PARAMETER SetFileSystem
        - Manage disk parameter.
        - File system which will be set on selected disk.
        - Maximum volume size for ntfs is 256000GiB.
        - Maximum volume size for refs is the maximum GetSize parameter value 18446744073709551615GiB.
        - If the disk size of the selected disk does not match with the passed value 
          for parameter SetFileSystem (e.g. "ntfs" over 256000GiB) the Cmdlet will be canceled.
        - Also consider the dynamic parameters SetLargerFRS, SetShortNames and SetIntegrityStreams
          which are switches who can be set in addition to the FileSystem parameter
          but they depend on the passed file system value. For more information read the DYNAMIC PARAMETERS
          part of the help section.
        .PARAMETER SetLabel
        - Manage disk parameter.
        - File system label which should be set for the file system on selected disk.
        .PARAMETER SetAllocationUnitSize
        - Manage disk parameter.
        - Allocation unit size which will be set for the file system on selected disk 
          (possible values for file system ntfs 4,8,16,32,64kb;refs 64kb).
        - If parameter SetFileSystem is set to "refs" the allocation unit size will be automatically adjusted to "64" (kb).
        .EXAMPLE
        Manage-Disk -GetNumber 1 -GetPartitionStyle 'raw' -GetOperationalStatus 'offline' ` 
        -SetPartitionStyle 'mbr' -SetPartitionAccessPath C:\Test -SetFileSystem 'ntfs' -SetLabel 'database_disk' -SetLargeFRS -SetShortNames -WhatIf

        This example would try to select and set the disk as specified and shows verbose logging information
        but would not apply any changes to the target because of the passed common parameter WhatIf.
        .EXAMPLE
        powershell -command "Edit-Disk -GetSize 50 -GetPartitionStyle 'mbr' -GetOperationalStatus 'online' -IsNotReadOnly `
        -SetPartitionStyle 'gpt' -SetDriveLetter F -SetFileSystem 'refs' -SetLabel 'application_disk' -SetAllocationUnitSize 64 -SetIntegrityStreams -Verbose"

        This example would try to select and set the disk as specified. 
        Furthermore it will show what was changed on the target caused by the common parameter -Verbose.
        In this example the Cmdlet is started in a new PowerShell session. 
        This is useful if you want to invoke the Cmdlet from within cmd or another tool which is not a PowerShell host (for instance Oasis).
        .EXAMPLE
        Get-Disk | Edit-Disk -IsNotReadOnly `
        -SetPartitionStyle 'gpt' -SetDriveLetter F -SetFileSystem 'refs' -SetLabel 'application_disk' -SetAllocationUnitSize 64 -SetIntegrityStreams

        In this example Get-Disk will pipe all found disk objects to the Edit-Disk Cmdlet (object per object).
        Not the whole disk object will be piped but the Number, PartitionStyle and OperationalStatus property of each disk object.
        Edit-Disk will use this information in order to find the respective disk and you don't need to pass this mentioned properties additionally as Edit-Disk
        parameters.
        .INPUTS
        You can pipe PowerShell objects to this Cmdlet which contain one or more of the following properties:
        
        - Number
        - PartitionStyle
        - OperationalStatus
        - (Size - not yet available, will be added in next version)
       
        To retrieve and pipe these objects you can use a PowerShell Cmdlet or an object created by your own (PSObject, PSCustomObject).
        Hashtables are not intended to be used for the pipeline.
        .OUTPUTS
        System.String. Edit-Disk returns a string with a in JSON converted hashtable.
        The hashtable contains the following items and sub-items:

        - changed
            - Whether anything was changed.
            Returned: always
            Type: boolean
            Sample: true

        - message
            - Possible error message on failure.
            Returned: failed
            Type: string
            Sample: "No free drive letter left on the target"

        - change_log
            - Dictionary containing all the detailed information about changes on the selected disk.
            Returned: if -WhatIf or/and -Verbose option was passed to the Cmdlet
            Type: complex
            Contains:

                allocation_unit
                    - Information whether allocation_unit_size value was automatically adjusted.
                    Returned: if file_system option value was refs and allocation_unit_size value was not 64
                    Type: string
                    Sample: "Size was automatically adjusted to 64kb due to file_system option value refs"

                initializing
                    - Detailed information about initializing the disk.
                    Returned: success or failed
                    Type: string
                    Sample: "Disk initialization successful - Partition style raw (GetPartitionStyle) 
                    was initalized to gpt (SetPartitionStyle)"

                converting
                    - Detailed information about converting the partition style.
                      of the disk (in case of converting no initalization of disk).
                    Returned: success or failed
                    Type: string
                    Sample: "Partition style mbr (GetPartitionStyle) was converted 
                    to gpt (SetPartitionStyle)"

                partitioning
                    - Detailed information about partition creation on the selected disk.
                    Returned: success or failed
                    Type: string
                    Sample: "Initial partition Basic was created successfully on partition style gpt"

                access_path
                    - Detailed information about access path creation on the partition of selected disk.
                    Returned: success or failed
                    Type: string
                    Sample: "Partition access path C:\\Test was created successfully for partition Basic"

                formatting
                    - Detailed information about volume creation on partitoned disk.
                    Returned: success or failed
                    Type: string
                    Sample: "Volume ReFS was created successfully on partition Basic"

                shellhw_service_state
                    - Information whether service could not be stopped or started.
                    Returned: if service could not be stopped
                    Type: string
                    Sample: "Could not be set from 'Stopped' to 'Running' again"
        .NOTES
          - To select the disk and to manage it you have several parameters which are all described in the documentation.
          - If you invoke the Cmdlet without any parameter the default parameter values will be used.
          - If you pass a decimal value for any of the int parameters it will be rounded to an even number.
          - To identify the parameters which are used to select a disk consider the "Get" verb in front of the parameter 
            (except for -IsNotReadOnly which is also a a select parameter) and the "Select disk parameter" hint in the parameter description.
          - To identify the parameters which are used to manage a disk consider the "Set" verb in front of the parameter and the 
            "Manage disk parameter" hint in the parameter description.
          - In order to find only one disk on the target you can use the GetSize and/or GetNumber parameter for the search of the disk.
          - If no GetSize and GetNumber parameter value was defined and multiple disks were found on the target based on the passed parameter values 
            the Cmdlet will select the first disk found.
          - There is one known bug if you don't set any value for parameter SetFileSystem. The dynamic variables get somehow
          - The Cmdlet detects any existing volume and/or partition on the selected disk and will cancel the Cmdlet in this case.
          - If the disk is not yet initialized the Cmdlet will initialize the disk (set partition style, online and writeable).
          - If the disk is initialized already the Cmdlet will try to set the disk to "online" and "writeable" (read-only eq. false) 
            if it's not the state of the disk already.
          - Further in this case it will convert the partition style of the disk to the selected partition style if needed.
          - The Cmdlet will stop and start the service "ShellHWService" again in order to avoid disk management GUI messages.
          - If the Cmdlet fails with an error and the operational status was set from "offline" to "online" before the Cmdlet will try to set 
            the disk to operational status "offline" again but will not be canceled if set "offline" again fails.
          - If the Cmdlet fails with an error and the writeable status was set from "read-only" to "writeable" before the Cmdlet will try to set 
            the disk to writeable status "read-only" again but will not be canceled if set "read-only" again fails.
          - If you use the common parameter -Verbose you will get detailed information about the changes on the target.
          - If you use the common parameter -WhatIf nothing will be changed on the target but you will get the information 
            what would be changed (contains -Verbose).
          - If you invoke the Cmdlet all common parameters are available but only -Verbose, -Whatif and -Confirm will take an affect.
          - Please note that in this Cmdlet -Verbose and -WhatIf does act in a different way as usual 
            because of the hashtable output (manual created Verbose and WhatIf output, not the standard Cmdlets output).
          - The Confirm parameter acts as per PowerShell standard behavior.
          - Of course you can use the common parameter -OutVariable.
          - The Cmdlet needs to be invoked with administrator privileges otherwise the Cmdlet will be canceled.
        .LINK
        Ansible Version: https://github.com/ansible/ansible/pull/27634
        .LINK
        Get-Disk
        Get-Volume
        Set-Disk
        Initialize-Disk
        New-Partition
        Format-Volume
        #>
        [CmdletBinding(
            SupportsShouldProcess = $true,
            ConfirmImpact = "High"
            )
        ]
        param(
                [Parameter(Position = 0)]
                [Alias('Size')]
                [ValidateRange(1,18446744073709551615)]
                [uint64]$GetSize,
                [Parameter(
                    Position = 1,
                    ValueFromPipelineByPropertyName = $true
                    )
                ]
                [Alias('Number')]
                [ValidateNotNullorEmpty()]
                [int32]$GetNumber,
                [Parameter(
                    Position = 2,
                    ValueFromPipelineByPropertyName = $true
                    )
                ]
                [Alias('PartitionStyle')]
                [ValidateSet("raw", "mbr", "gpt")]
                [string]$GetPartitionStyle = "raw",
                [Parameter(
                    Position = 3,
                    ValueFromPipelineByPropertyName = $true
                    )
                ]
                [Alias('OperationalStatus')]
                [ValidateSet("offline", "online")]
                [string]$GetOperationalStatus = "offline",
                [Parameter(Position = 4)]
                [switch]$IsNotReadOnly,
                [Parameter(
                    Position = 5,
                    Mandatory = $true,
                    HelpMessage = "Please enter a valid partition style (gpt or mbr) which should be set on the selected disk"
                    )
                ]
                [ValidateSet("gpt", "mbr")]
                [string]$SetPartitionStyle,
                [Parameter(Position = 7)]
                [ValidateScript( {
                            if ((-not ((Get-Partition).AccessPaths -like "$_*")) -and (Test-Path $_ -PathType Container) -and ((Get-Item $_).LinkType -eq $null)) {
                                if (-not (Get-ChildItem $_)) {
                                    $true
                                } else {
                                    throw "$_ is not an empty folder (contains files and/or folders)"                                    
                                }
                            } elseif ((Get-Partition).AccessPaths -like "$_*") {
                                throw "$_ is already in use as access path by another disk"
                            } elseif (-not (Test-Path $_ -PathType Container)) {
                                throw "$_ is not a valid path/directory/folder on the target for parameter SetPartitionStyle"
                            } elseif((Get-Item $_).LinkType -ne $null) {
                                throw "$_ is already in use as a link of type $((Get-Item $_).LinkType)"
                            }
                        }
                    )
                ]
                [string]$SetPartitionAccessPath,
                [Parameter(
                    Position = 8,
                    Mandatory = $true,
                    HelpMessage = "Please enter a valid file system (ntfs or refs) which should be set on the selected disk"
                    )
                ]
                [ValidateNotNullorEmpty()]
                [ValidateSet("ntfs", "refs")]
                [string]$SetFileSystem,
                [Parameter(Position = 9)]
                [ValidateNotNullorEmpty()]
                [string]$SetLabel = "additional_disk",
                [Parameter(
                    Position = 10,
                    Mandatory = $true,
                    HelpMessage = "Please enter a valid allocation unit size (4, 8, 16, 32 or 64) which should be set for the file system on the selected disk"
                    )
                ]
                [ValidateSet(4,8,16,32,64)]
                [int32]$SetAllocationUnitSize
        )
        DynamicParam {
                $DriveLetterAttribute = New-Object System.Management.Automation.ParameterAttribute
                $DriveLetterAttribute.Position = 6
                $DriveLetterAttribute.ParameterSetName = '__AllParameterSets'
                $attributeCollectionDriveLetter = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
                $attributeCollectionDriveLetter.Add($DriveLetterAttribute)
                $Letters  = try {
                                        (Get-ChildItem Function:[a-z]: -Name | Where-Object {
                                            -not (Test-Path -Path $_)
                                        }).TrimEnd(":")
                                    } catch {
                                        throw "Gather all free drive letters on the target failed"
                                    }
                $attributeCollectionDriveLetter.Add((New-Object  System.Management.Automation.ValidateSetAttribute($Letters)))  
                $DriveLetterParam = New-Object System.Management.Automation.RuntimeDefinedParameter('SetDriveLetter', [char], $attributeCollectionDriveLetter)
                $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
                $paramDictionary.Add('SetDriveLetter', $DriveLetterParam)
            
            if ($PSBoundParameters["SetFileSystem"]) {
                if ($SetFileSystem -eq "ntfs") {
                    $LargeFRSAttribute = New-Object System.Management.Automation.ParameterAttribute
                    $LargeFRSAttribute.Position = 11
                    $LargeFRSAttribute.ParameterSetName = '__AllParameterSets'
                    $attributeCollectionFRS = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
                    $attributeCollectionFRS.Add($LargeFRSAttribute)         
                    $LargeFRSParam = New-Object System.Management.Automation.RuntimeDefinedParameter('SetLargeFRS', [switch], $attributeCollectionFRS)

                    $paramDictionary.Add('SetLargeFRS', $LargeFRSParam)
                
                    $ShortNamesAttribute = New-Object System.Management.Automation.ParameterAttribute
                    $ShortNamesAttribute.Position = 12
                    $ShortNamesAttribute.ParameterSetName = '__AllParameterSets'
                    $attributeCollectionShort = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
                    $attributeCollectionShort.Add($ShortNamesAttribute)
                    $ShortNamesParam = New-Object System.Management.Automation.RuntimeDefinedParameter('SetShortNames', [switch], $attributeCollectionShort)
                    $paramDictionary.Add('SetShortNames', $ShortNamesParam)

                } elseif ($SetFileSystem -eq "refs") {
                    $IntegrityStreamsAttribute = New-Object System.Management.Automation.ParameterAttribute
                    $IntegrityStreamsAttribute.Position = 13
                    $IntegrityStreamsAttribute.ParameterSetName = '__AllParameterSets'
                    $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
                    $attributeCollection.Add($IntegrityStreamsAttribute)
                    $IntegrityStreamsParam = New-Object System.Management.Automation.RuntimeDefinedParameter('SetIntegrityStreams', [switch], $attributeCollection)

                    $paramDictionary.Add('SetIntegrityStreams', $IntegrityStreamsParam)
                }
            }
        return $paramDictionary
        }

        Process {
            # Check WhatIf and Verbose parameter
            [bool]$CheckMode = $WhatIfPreference
            [bool]$Verbose = if ($PSBoundParameters["Verbose"]) {
                                        $true
                                    } else {
                                        $false
                                    }

            # Create a new result object
            [hashtable]$result = @{
                    message = [string]::Empty
                    failed = $false
                    changed = $false
            }

            # Functions
            function Test-Admin {
                    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
                    $IsAdmin = $CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

                    return $IsAdmin
            }

            function Search-Disk {
                    param(
                            $DiskSize,
                            $PartitionStyle,
                            $OperationalStatus,
                            $ReadOnly,
                            $Number
                    )
                    if ($DiskSize -ne $null) {
                        $DiskSize = $DiskSize *1GB
                    }
                    if ($DiskSize -and ($Number -ne $null)) {
                        $disk = Get-Disk | Where-Object {
                            ($_.PartitionStyle -eq $PartitionStyle) -and ($_.OperationalStatus -eq $OperationalStatus) -and ($_.IsReadOnly -eq $ReadOnly) -and ($_.Size -eq $DiskSize) -and ($_.Number -eq $Number)
                        }
                    } elseif ($DiskSize) {
                        $disk = Get-Disk | Where-Object {
                            ($_.PartitionStyle -eq $PartitionStyle) -and ($_.OperationalStatus -eq $OperationalStatus) -and ($_.IsReadOnly -eq $ReadOnly) -and ($_.Size -eq $DiskSize)
                        }
                    } elseif ($Number -ne $null) {
                        $disk = Get-Disk | Where-Object {
                            ($_.PartitionStyle -eq $PartitionStyle) -and ($_.OperationalStatus -eq $OperationalStatus) -and ($_.IsReadOnly -eq $ReadOnly) -and ($_.Number -eq $Number)
                        }
                    } else {
                        $disk = Get-Disk | Where-Object {
                            ($_.PartitionStyle -eq $PartitionStyle) -and ($_.OperationalStatus -eq $OperationalStatus) -and ($_.IsReadOnly -eq $ReadOnly)
                        }
                    }

                    return $disk
            }

            function Set-OperationalStatus {
                    param(
                            $Disk,
                            [switch]$Deactivate
                    )
                    $null = Set-Disk -Number ($Disk.Number) -IsOffline $Deactivate.IsPresent
            }

            function Set-DiskWriteable {
                    param(
                            $Disk,
                            [switch]$Deactivate
                    )
                    $null = Set-Disk -Number ($Disk.Number) -IsReadonly $Deactivate.IsPresent
            }

            function Search-Volume {
                    param(
                            $Partition
                    )
                    $FoundVolume = Get-Volume | Where-Object {
                        $Partition.AccessPaths -like $_.ObjectId
                    }
                    if ($FoundVolume -eq $null) {
            
                        return $false
                    }

                    return $FoundVolume
            }

            function Set-Initialized {
                    param(
                            $Disk,
                            $PartitionStyle
                    )
                    $null = $Disk| Initialize-Disk -PartitionStyle $PartitionStyle -Confirm:$false
            }

            function Convert-PartitionStyle {
                    param(
                            $Disk,
                            $PartitionStyle
                    )
                    $null = Invoke-Expression "'Select Disk $($Disk.Number)','Convert $($PartitionStyle)' | diskpart"
            }

            function Manage-ShellHWService {
                    param(
                            $Action
                    )
                    switch ($Action) {
                            Stop {
                                $null = Stop-Service -Name ShellHWDetection
                            }
                            Start {
                                $null = Start-Service -Name ShellHWDetection
                            }
                            Check {
                                $CheckService = (Get-Service ShellHWDetection).Status -eq "Running"

                                return $CheckService
                            }
                    }
            }

            function Create-Partition {
                    param(
                            $Disk,
                            $SetDriveLetter
                    )
                    if (-not $SetDriveLetter -eq [string]::Empty) {
                        $Partition = $Disk | New-Partition -UseMaximumSize -DriveLetter $SetDriveLetter
                    } else {
                        $Partition = $Disk | New-Partition -UseMaximumSize
                    }

                    return $Partition
            }

            function Add-AccessPath {
                    param(
                            $Partition,
                            $Path
                    )
                    $null = $Partition | Add-PartitionAccessPath -AccessPath $Path
            }

            function Create-Volume {
                    param(
                            $Volume,
                            $FileSystem,
                            $FileSystemLabel,
                            $FileSystemAllocUnitSize,
                            $FileSystemLargeFRS,
                            $FileSystemShortNames,
                            $FileSystemIntegrityStreams
                    )
                    $Alloc = $FileSystemAllocUnitSize *1KB
                    [hashtable]$ParaVol = @{
                        FileSystem = $FileSystem
                        NewFileSystemLabel = $FileSystemLabel
                        AllocationUnitSize = $Alloc
                    }
                    switch ($FileSystem) {
                            ntfs {
                                $ParaVol += @{ShortFileNameSupport = $FileSystemShortNames; UseLargeFRS = $FileSystemLargeFRS}
                            }
                            refs {
                                $ParaVol['SetIntegrityStreams'] = $FileSystemIntegrityStreams
                            }
                    }
                    $CreatedVolume = $Volume | Format-Volume @ParaVol -Force -Confirm:$false

                    return $CreatedVolume
            }

            # Check admin rights
            if (-not (Test-Admin)) {
                $result.message = "Cmdlet was not started with elevated rights"
	            $result.failed = "true"
                return $result | ConvertTo-Json
            }

            # Rescan disks
            $null = Invoke-Expression '"rescan" | diskpart'

            # Search disk
            [hashtable]$ParamsDisk = @{
                DiskSize = if ($PSBoundParameters["GetSize"]) {
                                       $GetSize
                                    } else {
                                       $null
                                    }
                PartitionStyle = $GetPartitionStyle
                OperationalStatus = $GetOperationalStatus
                ReadOnly = if ($IsNotReadOnly.IsPresent) {
                                          $false
                                      } else {
                                          $true
                                      }
                Number = if ($PSBoundParameters["GetNumber"]) {
                                        $GetNumber
                                    } else {
                                        $null
                                    }
            }
            try {
                $disk = Search-Disk @ParamsDisk
            } catch {
                $result.message = "Failed to search and/or select the disk with the specified parameter values: $($_.Exception.Message)"
	            $result.failed = "true"
                return $result | ConvertTo-Json
            }
            if ($disk) {
                $diskcount = $disk | Measure-Object | Select-Object  -ExpandProperty Count
                if ($diskcount -ge 2) {
                    $disk = $disk[0]
                }
                [string]$DOperSt = $disk.OperationalStatus
                [string]$DPartStyle = $disk.PartitionStyle
                $DROState = $disk.IsReadOnly
            } else {
                    $result.message = "No disk could be found and selected with the passed parameter values"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
            }
        
            # Create change log
            if ($CheckMode -or $Verbose) {
                $result += @{ 
                    change_log = @{
                    }
                }
            }

            # Check and set operational status and read-only state
            $SetOnline = $false
            $SetWriteable = $false
            $OPStatusFailed = $false
            $ROStatusFailed = $false
            if ($DPartStyle -ne "RAW") {
                if ($DOperSt -ne "Online") {
                    if (-not $CheckMode) {
                        # Set online
                        try {
                            Set-OperationalStatus -Disk $disk
                        } catch {
                            $result.message = "Failed to set the disk online: $($_.Exception.Message)"
	                        $result.failed = "true"
                            if ($Verbose) {
                                $result.Remove("change_log")
                            }
                            return $result | ConvertTo-Json
                        }
                        $result.changed = $true
                        $SetOnline = $true
                    }
                }      
                if ($DROState -eq $true) {
                    if (-not $CheckMode) {
                        # Set writeable
                        try {
                            Set-DiskWriteable -Disk $disk
                        } catch {
                            if ($SetOnline) {
                                try {
                                    Set-OperationalStatus -Disk $disk -Deactivate
                                } catch {
                                    $OPStatusFailed = $true
                                } finally {
                                    if (-not $OPStatusFailed) {
                                        $result.changed = $true
                                    }
                                }
                            }
                            $result.message = "Failed to set the disk from read-only to writeable state: $($_.Exception.Message)"
	                        $result.failed = "true"
                            return $result | ConvertTo-Json
                        }
                        $result.changed = $true
                        $SetWriteable = $true
                    }
                } 
            }

            # Check volumes and partitions
            $PartNumber = $disk.NumberOfPartitions
            # Verify partitons and volumes
            if ($PartNumber -ge 1) {
                # Collect partitions
                try {
                    $partition = Get-Partition -DiskNumber $disk.Number
                } catch {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    $result.message = "General error while searching for partitions on the selected disk: $($_.Exception.Message)"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
                # Collect volumes
                try {
                    $volume = Search-Volume -Partition $partition
                } catch {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    $result.message = "General error while searching for volumes on the selected disk: $($_.Exception.Message)"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
                # Existent volumes and partitions
                if (-not $volume) {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    $result.message = "Existing partitions found on the selected disk"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                } else {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    $result.message = "Existing volumes found on the selected disk"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
            }

            # Check set parameter values
            # Check drive letter and access path
            if ((-not $PSBoundParameters["SetDriveLetter"]) -and ($SetPartitionAccessPath -eq [String]::Empty)) {
                 # Use random drive letter
                    try {
                        $DriveLetter = Get-ChildItem Function:[a-z]: -Name | Where-Object {
                            -not (Test-Path -Path $_)
                        } | Get-Random
                    } catch {
                        if ($SetOnline) {
                            try {
                                Set-OperationalStatus -Disk $disk -Deactivate
                            } catch {
                                $OPStatusFailed = $true
                            } finally {
                                if (-not $OPStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        if ($SetWriteable) {
                            try {
                                Set-DiskWriteable -Disk $disk -Deactivate
                            } catch {
                                $ROStatusFailed = $true
                            } finally {
                                if (-not $ROStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        $result.message = "The check to get free drive letters on the target failed"
	                    $result.failed = "true"
                        return $result | ConvertTo-Json
                    }
                    if ($DriveLetter) {
                        $SetDriveLetter = $DriveLetter.TrimEnd(":")
                    } else {
                        if ($SetOnline) {
                            try {
                                Set-OperationalStatus -Disk $disk -Deactivate
                            } catch {
                                $OPStatusFailed = $true
                            } finally {
                                if (-not $OPStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        if ($SetWriteable) {
                            try {
                                Set-DiskWriteable -Disk $disk -Deactivate
                            } catch {
                                $ROStatusFailed = $true
                            } finally {
                                if (-not $ROStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        $result.message = "No free drive letter left on the target"
	                    $result.failed = "true"
                        return $result | ConvertTo-Json
                    }
            } elseif (-not $PSBoundParameters["SetDriveLetter"]) {
                [string]$SetDriveLetter = [string]::Empty
            } else {
                $SetDriveLetter = $PSBoundParameters.SetDriveLetter
            }
            # Check file system
            if ($SetFileSystem -eq "ntfs") {
                if ($GetSize -le 256000) {
                } else {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    $result.message = "Parameter size with value $($GetSize)GiB is not a valid size for ntfs hence the disk can not be formatted with this file system"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
            } elseif ($SetFileSystem -eq "refs") {
                if ($SetAllocationUnitSize -ne 64) {
                    $SetAllocationUnitSize = 64  
                }
            }

            # Initialize / convert disk
            if ($DPartStyle -eq "RAW") {
                if (-not $CheckMode) {
                    if ($DOperSt -eq "Offline") {
                        $SetOnline = $true
                    }
                    if ($DROState -eq $true) {
                        $SetWriteable = $true
                    }
                    # Initialize disk
                    try {
                        Set-Initialized -Disk $disk -PartitionStyle $SetPartitionStyle
                    } catch {
                        $GetDiskFailed = $false
                        $FailDisk = $null
                        if ($SetOnline) {
                            try {
                                $FailDisk = Get-Disk -Number $disk.Number
                            } catch {
                                $GetDiskFailed = $true
                            } finally {
                                if (-not $GetDiskFailed) {
                                    try {
                                        Set-OperationalStatus -Disk $disk -Deactivate
                                    } catch {
                                        $OPStatusFailed = $true
                                    }
                                    if (-not $OPStatusFailed) {
                                        $result.changed = $true
                                    }
                                }
                            }
                        }
                        if ($SetWriteable) {
                            if (-not $FailDisk) {
                                try {
                                    $FailDisk = Get-Disk -Number $disk.Number
                                } catch {
                                    $GetDiskFailed = $true
                                }
                            }
                            if (-not $GetDiskFailed) {
                                try {
                                    Set-DiskWriteable -Disk $disk -Deactivate
                                } catch {
                                    $ROStatusFailed = $true
                                } finally {
                                    if (-not $ROStatusFailed) {
                                        $result.changed = $true
                                    }
                                }
                            }
                        }
                        $result.message = "Failed to initialize the disk: $($_.Exception.Message)"
	                    $result.failed = "true"
                        return $result | ConvertTo-Json
                    }
                    if ($Verbose) {
                        $result.change_log.initializing = "Disk initialization successful - Partition style $GetPartitionStyle (partition_style_select) was initalized to $SetPartitionStyle (partition_style_set)"
                    }
                    $result.changed = $true
                } else {
                    $result.change_log.initializing = "Disk with partition style $GetPartitionStyle (partition_style_select) will not be initialized to $SetPartitionStyle (partition_style_set) due to passed -WhatIf switch"
                }
            } else {
                if ($DPartStyle -ne $SetPartitionStyle) {
                    if (-not $CheckMode) {
                        # Convert disk
                        try {
                            Convert-PartitionStyle -Disk $disk -PartitionStyle $SetPartitionStyle
                        } catch {
                            if ($SetOnline) {
                                try {
                                    Set-OperationalStatus -Disk $disk -Deactivate
                                } catch {
                                    $OPStatusFailed = $true
                                } finally {
                                    if (-not $OPStatusFailed) {
                                        $result.changed = $true
                                    }
                                }
                            }
                            if ($SetWriteable) {
                                try {
                                    Set-DiskWriteable -Disk $disk -Deactivate
                                } catch {
                                    $ROStatusFailed = $true
                                } finally {
                                    if (-not $ROStatusFailed) {
                                        $result.changed = $true
                                    }
                                }
                            }
                            $result.message = "Failed to convert the disk: $($_.Exception.Message)"
	                        $result.failed = "true"
                            return $result | ConvertTo-Json
                        }
                        if ($Verbose) {
                            $result.change_log.converting = "Partition style $GetPartitionStyle (partition_style_select) was converted to $SetPartitionStyle (partition_style_set)"
                        }
                        $result.changed = $true
                    } else {
                        $result.change_log.converting = "Disk will not be converted from partition style $GetPartitionStyle (partition_style_select) to $SetPartitionStyle (partition_style_set) due to passed -WhatIf switch"
                    }
                }
            }

            # Maintain ShellHWService (not Cmdlet terminating)
            $StopSuccess = $false
            $StopFailed = $false
            $StartFailed = $false
            $CheckFailed = $false
            # Check ShellHWService
            try {
                $Check = Manage-ShellHWService -Action "Check"
            } catch {
                $CheckFailed = $true
            } finally {
                if ($Check) {
                    if (-not $CheckMode) {
                        # Stop ShellHWService
                        try {
                            Manage-ShellHWService -Action "Stop"
                        } catch {
                            $StopFailed = $true
                        } finally {
                            if (-not $StopFailed) {
                                $StopSuccess = $true
                                $result.changed = $true
                            }
                        }
                    }
                } elseif ($CheckFailed) {
                    if ($Verbose) {
                        $result.change_log.shellhw_service_state = "Service will not be changed because the check has failed"
                    }
                }
            }

            # Part disk
            if (-not $CheckMode) {
                try {
                    $CPartition = Create-Partition -Disk $disk -SetDriveLetter $SetDriveLetter
                } catch {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($StopSuccess) {
                        try {
                            Manage-ShellHWService -Action "Start"
                        } catch {
                            $StartFailed = $true
                        } finally {
                            if (-not $StartFailed) {
                                $result.changed = $true
                            } else {
                                if ($Verbose) {
                                    $result.change_log.shellhw_service_state = "Could not be set from 'Stopped' to 'Running' again"
                                }
                            }
                        }
                    }
                    $result.message = "Failed to create the partition on the disk: $($_.Exception.Message)"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
                if ($Verbose) {
                    if ((-not $PSBoundParameters["SetDriveLetter"]) -and ($SetPartitionAccessPath -eq [String]::Empty)) {
                        $result.change_log.partitioning = "Initial partition $($CPartition.Type) with random drive letter $SetDriveLetter was created successfully on partition style $SetPartitionStyle"
                    } elseif (-not $PSBoundParameters["SetDriveLetter"]) {
                        $result.change_log.partitioning = "Initial partition $($CPartition.Type) with no drive letter was created successfully on partition style $SetPartitionStyle"
                    } else {
                        $result.change_log.partitioning = "Initial partition $($CPartition.Type) with passed drive letter $SetDriveLetter was created successfully on partition style $SetPartitionStyle"
                    }
                }
                $result.changed = $true
            } else {
                $result.change_log.partitioning = "Disk will not be partitioned due to passed -WhatIf switch"
            }

            # Add partition access path
            if (-not $SetPartitionAccessPath -eq [String]::Empty) {
                if (-not $CheckMode) {
                    try {
                        Add-AccessPath -Partition $CPartition -Path $SetPartitionAccessPath
                    } catch {
                        if ($SetOnline) {
                            try {
                                Set-OperationalStatus -Disk $disk -Deactivate
                            } catch {
                                $OPStatusFailed = $true
                            } finally {
                                if (-not $OPStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        if ($SetWriteable) {
                            try {
                                Set-DiskWriteable -Disk $disk -Deactivate
                            } catch {
                                $ROStatusFailed = $true
                            } finally {
                                if (-not $ROStatusFailed) {
                                    $result.changed = $true
                                }
                            }
                        }
                        if ($StopSuccess) {
                            try {
                                Manage-ShellHWService -Action "Start"
                            } catch {
                                $StartFailed = $true
                            } finally {
                                if (-not $StartFailed) {
                                    $result.changed = $true
                                } else {
                                    if ($Verbose) {
                                        $result.change_log.shellhw_service_state = "Could not be set from 'Stopped' to 'Running' again"
                                    }
                                }
                            }
                        }
                        $result.message = "Failed to create partition access path: $($_.Exception.Message)"
	                    $result.failed = "true"
                        return $result | ConvertTo-Json
                    }
                    if ($Verbose) {
                        $result.change_log.access_path = "Partition access path $SetPartitionAccessPath was created successfully for partition $($CPartition.Type)"
                    }
                    $result.changed = $true
                } else {
                    $result.change_log.access_path = "Partition access path will not be added to partition due to passed -WhatIf switch"
                }
            }

            # Create volume
            if (-not $CheckMode) {
                [hashtable]$ParamsVol = @{
                    Volume = $CPartition
                    FileSystem = $SetFileSystem
                    FileSystemLabel = $SetLabel
                    FileSystemAllocUnitSize = $SetAllocationUnitSize
                    FileSystemLargeFRS = if ($PSBoundParameters["SetLargeFRS"]) {
                                                                $PSBoundParameters.SetLargeFRS.IsPresent
                                                            } else {
                                                                $false
                                                            }
                    FileSystemShortNames = if ($PSBoundParameters["SetShortNames"]) {
                                                                        $PSBoundParameters.SetShortNames.IsPresent
                                                                    } else {
                                                                        $false
                                                                    }
                    FileSystemIntegrityStreams = if ($PSBoundParameters["SetIntegrityStreams"]) {
                                                        $PSBoundParameters.SetIntegrityStreams.IsPresent
                                                    } else {
                                                        $false
                                                    }
                }
                try {
                    $CVolume = Create-Volume @ParamsVol
                } catch {
                    if ($SetOnline) {
                        try {
                            Set-OperationalStatus -Disk $disk -Deactivate
                        } catch {
                            $OPStatusFailed = $true
                        } finally {
                            if (-not $OPStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($SetWriteable) {
                        try {
                            Set-DiskWriteable -Disk $disk -Deactivate
                        } catch {
                            $ROStatusFailed = $true
                        } finally {
                            if (-not $ROStatusFailed) {
                                $result.changed = $true
                            }
                        }
                    }
                    if ($StopSuccess) {
                        try {
                            Manage-ShellHWService -Action "Start"
                        } catch {
                            $StartFailed = $true
                        } finally {
                            if (-not $StartFailed) {
                                $result.changed = $true
                            } else {
                                if ($Verbose) {
                                    $result.change_log.shellhw_service_state = "Could not be set from 'Stopped' to 'Running' again"
                                }
                            }
                        }
                    }
                    $result.message = "Failed to create the volume on the disk: $($_.Exception.Message)"
	                $result.failed = "true"
                    return $result | ConvertTo-Json
                }
                if ($Verbose) {
                    $result.change_log.formatting = "Volume $($CVolume.FileSystem) with allocation unit size $SetAllocationUnitSize and label $SetLabel was created successfully on partition $($CPartition.Type)"
                }
                $result.changed = $true
            } else {
                $result.change_log.formatting = "Disk will not be formatted due to passed -WhatIf switch"
            }

            # Finally check if ShellHWService needs to be started again
            if (-not $CheckMode) {
                if ($StopSuccess) {
                    # Start ShellHWService
                    try {
                        Manage-ShellHWService -Action "Start"
                    } catch {
                        $StartFailed = $true
                    } finally {
                        if (-not $StartFailed) {
                            if ($Verbose) {
                                $result.change_log.shellhw_service_state = "Set from 'Stopped' to 'Running' again"
                            }
                            $result.changed = $true
                        } else {
                            if ($Verbose) {
                                $result.change_log.shellhw_service_state = "Could not be set from 'Stopped' to 'Running' again"
                            }
                        }
                    }
                }
            }

            # Return result
            $result.message = "Cmdlet finished successfully"
            return $result | ConvertTo-Json
        }
}
# Define module environment settings
$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Export functions and aliases
Set-Alias Get-DiskInfo Get-DiskFacts
Set-Alias Manage-Disk Edit-Disk
Export-ModuleMember -Function *-Disk* -Alias Manage-Disk, Get-DiskInfo