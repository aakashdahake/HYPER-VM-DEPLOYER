
Add-Type -AssemblyName System.Windows.Forms
Get-Module -Name Servermanager* -ListAvailable | Import-Module
#Load Assemblies
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null


# ------------------------------GUI Elements----------------------------------

$Form1 = New-Object System.Windows.Forms.Form
$Form1.ClientSize = New-Object System.Drawing.Size(407, 390)
$form1.topmost = $true
#$form1.Icon = "C:\icon.ico"
$form1.Text = "HVMD Hyper V"
$form1.Width = 340
$Form1.Height = 470
$Form1.FormBorderStyle = 'Fixed3D'
$Form1.MaximizeBox = $false
$Form1.StartPosition = "centerscreen"
$Form1.BackColor = 'DarkRed'

$by = New-Object System.Windows.Forms.Label
$by.Location = New-Object System.Drawing.Point(220, 416)
$by.Size = New-Object System.Drawing.Size(200, 23)
$by.Text = "by Aakash Dahake"
$by.ForeColor = "White"
$by.BackColor = 'Transparent'
$Form1.Controls.Add($by)

$mod = New-Object System.Windows.Forms.Label
$mod.Location = New-Object System.Drawing.Point(65, 15)
$mod.Size = New-Object System.Drawing.Size(400, 20)
$mod.Text = "HYPER-V VM DEPLOYER"
$mod.ForeColor = "White"
$mod.BackColor = 'Transparent'
$Form1.Controls.Add($mod)

$mod1 = New-Object System.Windows.Forms.Label
$mod1.Location = New-Object System.Drawing.Point(100, 35)
$mod1.Size = New-Object System.Drawing.Size(400, 23)
$mod1.Text = "HYPER-V VM DEPLOY "
$mod1.ForeColor = "White"
$mod1.BackColor = 'Transparent'
Form1.Controls.Add($mod1)

$mod2 = New-Object System.Windows.Forms.Label
$mod2.Size = New-Object System.Drawing.Size(400, 23)
$mod2.ForeColor = "White"
$mod2.BackColor = 'Transparent'
$Form1.Controls.Add($mod2)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(110, 285)
$Button.Size = New-Object System.Drawing.Size(98, 23)
$Button.Text = "Start >"
$Button.BackColor = 'White'
$Button.add_Click{Clear-Host; Config}
$Form1.Controls.Add($Button)

#Storage menu
$cb2 = New-Object System.Windows.Forms.ComboBox
$cb2.Location = New-Object System.Drawing.Point(85, 47)
$cb2.Size = New-Object System.Drawing.Size(200, 23)
$cb2.DropDownStyle = 'DropDownList'

#Storage label
$labe2 = New-Object System.Windows.Forms.Label
$labe2.Location = New-Object System.Drawing.Point(15, 50)
$labe2.Size = New-Object System.Drawing.Size(70, 23)
$labe2.Text = "Storage"
$labe2.ForeColor = "White"
$labe2.BackColor = 'Transparent'

#Storage status
$tbst = New-Object System.Windows.Forms.TextBox
$tbst.Location = New-Object System.Drawing.Point(85, 74)
$tbst.Size = New-Object System.Drawing.Size(200, 23)
$tbst.ReadOnly = $true

#Label for tbst
$lst = New-Object System.Windows.Forms.Label
$lst.Location = New-Object System.Drawing.Point(15, 77)
$lst.Size = New-Object System.Drawing.Size(70, 23)
$lst.Text = "Status"
$lst.ForeColor = "White"
$lst.BackColor = 'Transparent'

#Generation box
$cb3 = New-Object System.Windows.Forms.ComboBox
$cb3.Location = New-Object System.Drawing.Point(85, 182)
$cb3.Size = New-Object System.Drawing.Size(200, 23)
$cb3.DropDownStyle = 'DropDownList'
$cb3.Enabled = $false

#Generation label
$lwin = New-Object System.Windows.Forms.Label
$lwin.Location = New-Object System.Drawing.Point(15, 186)
$lwin.Size = New-Object System.Drawing.Size(70, 23)
$lwin.Text = "Generation"
$lwin.ForeColor = "White"
$lwin.BackColor = 'Transparent'
$lwin.Enabled = $false

#Switch dropdown
$nwcb = New-Object System.Windows.Forms.ComboBox
$nwcb.Location = New-Object System.Drawing.Point(85, 209)
$nwcb.Size = New-Object System.Drawing.Size(200, 23)
$nwcb.DropDownStyle = 'DropDownList'

#Switch label
$ledi = New-Object System.Windows.Forms.Label
$ledi.Location = New-Object System.Drawing.Point(15, 213)
$ledi.Size = New-Object System.Drawing.Size(70, 23)
$ledi.Text = "Network"
$ledi.ForeColor = "White"
$ledi.BackColor = 'Transparent'

#Browse  label
$brl = New-Object System.Windows.Forms.Label
$brl.Location = New-Object System.Drawing.Point(15, 105)
$brl.Size = New-Object System.Drawing.Size(70, 23)
$brl.Text = "Browse"
$brl.ForeColor = "White"
$brl.BackColor = 'Transparent'

#Browse button
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(84, 100)
$Button2.Size = New-Object System.Drawing.Size(202, 23)
$Button2.Text = "< Browse Storage Directory >"
$Button2.BackColor = 'White'

#Browse dialog
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{ ShowNewFolderButton = $true}

#Deploy combobox
$depcb = New-Object System.Windows.Forms.ComboBox
$depcb.Location = New-Object System.Drawing.Point(85, 128)
$depcb.Size = New-Object System.Drawing.Size(200, 23)
$depcb.DropDownStyle = 'DropDownList'   
         
#Deploy label
$depl = New-Object System.Windows.Forms.Label
$depl.Location = New-Object System.Drawing.Point(15, 131)
$depl.Size = New-Object System.Drawing.Size(70, 23)
$depl.Text = "Deploy"
$depl.ForeColor = "White"
$depl.BackColor = 'Transparent'          
         
#Windows/Appliance combobox
$wincb = New-Object System.Windows.Forms.ComboBox
$wincb.Location = New-Object System.Drawing.Point(85, 155)
$wincb.Size = New-Object System.Drawing.Size(200, 23)
$wincb.DropDownStyle = 'DropDownList'   
$wincb.Enabled = $False
      
#Windows/Appliance label
$winl = New-Object System.Windows.Forms.Label
$winl.Location = New-Object System.Drawing.Point(15, 159)
$winl.Size = New-Object System.Drawing.Size(70, 23)
$winl.Text = "Windows"
$winl.ForeColor = "White"
$winl.BackColor = 'Transparent' 

#Name textbox
$nametb = New-Object System.Windows.Forms.TextBox
$nametb.Location = New-Object System.Drawing.Point(85, 236)
$nametb.Size = New-Object System.Drawing.Size(200, 23) 
         
#Name label
$namel = New-Object System.Windows.Forms.Label
$namel.Location = New-Object System.Drawing.Point(15, 240)
$namel.Size = New-Object System.Drawing.Size(70, 23)
$namel.Text = "VM Name"
$namel.ForeColor = "White"
$namel.BackColor = 'Transparent' 

#CPU textbox
$cputb = New-Object System.Windows.Forms.ComboBox
$cputb.Location = New-Object System.Drawing.Point(85, 262)
$cputb.Size = New-Object System.Drawing.Size(60, 23) 
$cputb.DropDownStyle = 'DropDownList' 

#RAM textbox
$ramtb = New-Object System.Windows.Forms.ComboBox
$ramtb.Location = New-Object System.Drawing.Point(195, 262)
$ramtb.Size = New-Object System.Drawing.Size(90, 23) 
$ramtb.DropDownStyle = 'DropDownList'  
         
#CPU label
$cpul = New-Object System.Windows.Forms.Label
$cpul.Location = New-Object System.Drawing.Point(15, 267)
$cpul.Size = New-Object System.Drawing.Size(70, 23)
$cpul.Text = "CPU"
$cpul.ForeColor = "White"
$cpul.BackColor = 'Transparent' 

#Ram label
$raml = New-Object System.Windows.Forms.Label
$raml.Location = New-Object System.Drawing.Point(155, 267)
$raml.Size = New-Object System.Drawing.Size(50, 23)
$raml.Text = "RAM"
$raml.ForeColor = "White"
$raml.BackColor = 'Transparent' 

#Deploy button
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Point(188, 370)
$Button3.Size = New-Object System.Drawing.Size(98, 23)
$Button3.Text = "Deploy >"
$Button3.BackColor = 'White'
$Button3.add_Click({
                    if($ramtb.Text -eq '512 MB'){$r = 512MB} Elseif($ramtb.Text -eq '1024 MB'){$r = 1024MB} Elseif($ramtb.Text -eq '2048 MB'){$r = 2048MB} Elseif($ramtb.Text -eq '3072 MB'){$r = 3072MB} Elseif($ramtb.Text -eq '4096 MB'){$r = 4096MB}
                    $pass = checkip ($ipbox.Text)
                     if($pass -eq $false)
                    {
                        $Form1.Hide()
                        Deploy ($nametb.Text) $r ($FolderBrowser.SelectedPath) ($nwcb.Text) ($cb3.Text) ($cputb.Text)
                    }
                    else { $Form1.SendToBack(); (New-Object -ComObject Wscript.Shell).Popup("Entered IP is already in use, Please enter different one",0,"Warning",0) }
                  })

#IP box 
$ipbox = New-Object System.Windows.Forms.TextBox
$ipbox.Location = New-Object System.Drawing.Point(85, 289)
$ipbox.Size = New-Object System.Drawing.Size(200, 23)

#IP Label 
$iplb = New-Object System.Windows.Forms.Label
$iplb.Location = New-Object System.Drawing.Point(15,294)
$iplb.Size = New-Object System.Drawing.Size(70, 23)
$iplb.Text = "IP"
$iplb.ForeColor = "White"
$iplb.BackColor = 'Transparent'

#Gateway Label 
$gtlb = New-Object System.Windows.Forms.Label
$gtlb.Location = New-Object System.Drawing.Point(15,321)
$gtlb.Size = New-Object System.Drawing.Size(70, 23)
$gtlb.Text = "Gateway"
$gtlb.ForeColor = "White"
$gtlb.BackColor = 'Transparent'

#Gateway box 
$gtbox = New-Object System.Windows.Forms.TextBox
$gtbox.Location = New-Object System.Drawing.Point(85, 316)
$gtbox.Size = New-Object System.Drawing.Size(200, 23)

#DNS Label 
$dnslb = New-Object System.Windows.Forms.Label
$dnslb.Location = New-Object System.Drawing.Point(15,348)
$dnslb.Size = New-Object System.Drawing.Size(70, 23)
$dnslb.Text = "DNS"
$dnslb.ForeColor = "White"
$dnslb.BackColor = 'Transparent'

#DNS box 
$dnsbox = New-Object System.Windows.Forms.ComboBox
$dnsbox.Location = New-Object System.Drawing.Point(85, 343)
$dnsbox.Size = New-Object System.Drawing.Size(200, 23)
$dnsbox.Text = "192.168.20.100"

#Deploying label 
$deplb = New-Object System.Windows.Forms.Label
$deplb.Location = New-Object System.Drawing.Point(15,72)
$deplb.Size = New-Object System.Drawing.Size(200, 23)
$deplb.ForeColor = "White"
$deplb.BackColor = 'Transparent'

#Creating VM label
$cvmlb = New-Object System.Windows.Forms.Label
$cvmlb.Location = New-Object System.Drawing.Point(15,99)
$cvmlb.Size = New-Object System.Drawing.Size(200, 23)
$cvmlb.ForeColor = "White"
$cvmlb.BackColor = 'Transparent'

#Starting VM label
$startvm = New-Object System.Windows.Forms.Label
$startvm.Location = New-Object System.Drawing.Point(15,126)
$startvm.Size = New-Object System.Drawing.Size(200, 23)
$startvm.ForeColor = "White"
$startvm.BackColor = 'Transparent'

#NW set VM label
$nwl = New-Object System.Windows.Forms.Label
$nwl.Location = New-Object System.Drawing.Point(15,153)
$nwl.Size = New-Object System.Drawing.Size(200, 23)
$nwl.ForeColor = "White"
$nwl.BackColor = 'Transparent'

#Done label
$donel = New-Object System.Windows.Forms.Label
$donel.Location = New-Object System.Drawing.Point(15,180)
$donel.Size = New-Object System.Drawing.Size(200, 23)
$donel.ForeColor = "White"
$donel.BackColor = 'Transparent'



#-----------------------------------Functions-------------------------------------

$state = Get-WindowsFeature Hyper-V
if($state.Installed -eq "True")
{
    $Button.Enabled = $true
    $mod2.Location = New-Object System.Drawing.Point(80, 250)
    $mod2.Text = "HYPER-V ROLE IS DETECTED"
}
Else
{
    $Button.Enabled = $false
    $mod2.Location = New-Object System.Drawing.Point(17, 250)
    $mod2.Text = "HYPER-V ROLE IS NOT INSTALLED ON THIS MACHINE"
}

function checkip($ip)
{
    if (test-connection $ip -Count 1 -ErrorAction SilentlyContinue ) 
       {
            return $true
       }
    else 
       {
            return $false
                
       }
}

Function Set-VMNetworkConfiguration {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true,
                   Position=1,
                   ParameterSetName='DHCP',
                   ValueFromPipeline=$true)]
        [Parameter(Mandatory=$true,
                   Position=0,
                   ParameterSetName='Static',
                   ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter]$NetworkAdapter,

        [Parameter(Mandatory=$true,
                   Position=1,
                   ParameterSetName='Static')]
        [String[]]$IPAddress=@(),

        [Parameter(Mandatory=$false,
                   Position=2,
                   ParameterSetName='Static')]
        [String[]]$Subnet=@(),

        [Parameter(Mandatory=$false,
                   Position=3,
                   ParameterSetName='Static')]
        [String[]]$DefaultGateway = @(),

        [Parameter(Mandatory=$false,
                   Position=4,
                   ParameterSetName='Static')]
        [String[]]$DNSServer = @(),

        [Parameter(Mandatory=$false,
                   Position=0,
                   ParameterSetName='DHCP')]
        [Switch]$Dhcp
    )

    $VM = Get-WmiObject -Namespace 'root\virtualization\v2' -Class 'Msvm_ComputerSystem' | Where-Object { $_.ElementName -eq $NetworkAdapter.VMName } 
    $VMSettings = $vm.GetRelated('Msvm_VirtualSystemSettingData') | Where-Object { $_.VirtualSystemType -eq 'Microsoft:Hyper-V:System:Realized' }    
    $VMNetAdapters = $VMSettings.GetRelated('Msvm_SyntheticEthernetPortSettingData') 

    $NetworkSettings = @()
    foreach ($NetAdapter in $VMNetAdapters) {
        if ($NetAdapter.Address -eq $NetworkAdapter.MacAddress) {
            $NetworkSettings = $NetworkSettings + $NetAdapter.GetRelated("Msvm_GuestNetworkAdapterConfiguration")
        }
    }

    $NetworkSettings[0].IPAddresses = $IPAddress
    $NetworkSettings[0].Subnets = $Subnet
    $NetworkSettings[0].DefaultGateways = $DefaultGateway
    $NetworkSettings[0].DNSServers = $DNSServer
    $NetworkSettings[0].ProtocolIFType = 4096

    if ($dhcp) {
        $NetworkSettings[0].DHCPEnabled = $true
    } else {
        $NetworkSettings[0].DHCPEnabled = $false
    }

    $Service = Get-WmiObject -Class "Msvm_VirtualSystemManagementService" -Namespace "root\virtualization\v2"
    $setIP = $Service.SetGuestNetworkAdapterConfiguration($VM, $NetworkSettings[0].GetText(1))

    if ($setip.ReturnValue -eq 4096) {
        $job=[WMI]$setip.job 

        while ($job.JobState -eq 3 -or $job.JobState -eq 4) {
            start-sleep 1
            $job=[WMI]$setip.job
        }

        if ($job.JobState -eq 7) {
            write-host "Success"
        }
        else {
            $job.GetError()
        }
    } elseif($setip.ReturnValue -eq 0) {
        Write-Host "Success"
    }
}
function Config
{
    $Form1.Controls.Remove($Button)
    $Form1.Controls.Remove($mod1)
    $Form1.Controls.Remove($mod2)
    $Form1.Controls.Add($labe2)
    $Form1.Controls.Add($cb2)
    $Form1.Controls.Add($tbst)
    $Form1.Controls.Add($lst)
    $Form1.Controls.Add($cb3)
    $Form1.Controls.Add($lwin)
    $Form1.Controls.Add($nwcb)
    $Form1.Controls.Add($ledi)
    $Form1.Controls.Add($Button2)
    $Form1.Controls.Add($brl)
    $Form1.Controls.Add($depcb)
    $Form1.Controls.Add($depl)
    $Form1.Controls.Add($wincb)
    $Form1.Controls.Add($winl)
    $Form1.Controls.Add($nametb)
    $Form1.Controls.Add($namel)
    $Form1.Controls.Add($ramtb)
    $Form1.Controls.Add($cputb)
    $Form1.Controls.Add($raml)
    $Form1.Controls.Add($cpul)
    $Form1.Controls.Add($Button3)
    $Form1.Controls.Add($ipbox)
    $Form1.Controls.Add($iplb)
    $Form1.Controls.Add($gtlb)
    $Form1.Controls.Add($gtbox)
    $Form1.Controls.Add($dnslb)
    $Form1.Controls.Add($dnsbox)
    $cputb.DataSource = 1,2,3,4
    $ramtb.DataSource = '512 MB','1024 MB','2048 MB','3072 MB','4096 MB'
    $depcb.DataSource = 'Virtual Machine','UB'
    $disket = Get-Volume | where {$_.DriveLetter -ne $null -and $_.DriveType -eq "Fixed" -and $_.HealthStatus -eq "Healthy" -and $_.FileSystemLabel -ne "System Reserved" -and $_.FileSystem -ne "CSVFS"}
    $disket.DriveLetter | % {$cb2.Items.Add($_)}

    $cb2.add_SelectedValueChanged{
        $total = (Get-Volume | where {$_.DriveLetter -eq $cb2.Text} | select {$_.Size/1GB}).'$_.Size/1GB'
        $free = (Get-Volume | where {$_.DriveLetter -eq $cb2.Text} | select {$_.SizeRemaining/1GB}).'$_.SizeRemaining/1GB'
        $tbst.Text = 'Total - '+[math]::Round($total,2)+' GB   |   Free - '+[math]::Round($free,2)+' GB'
        
        }
    
    $cb3.DataSource = 1,2
    $nw = (Get-VMSwitch).Name 
    $nwcb.DataSource = $nw
    $Button2.add_Click{[void]$FolderBrowser.ShowDialog();
                        $Button2.Text = $FolderBrowser.SelectedPath
                      }
    $depcb.Text = ' ' 
    $depcb.add_SelectedValueChanged{
        if($depcb.Text -eq "Virtual Machine")
        {
            $wincb.Enabled = $true
            $cb3.Enabled = $true
            $cputb.Enabled = $true
           $ramtb.Enabled = $true
            $winl.Text = "Windows"
            $wincb.DataSource = 'Windows Server 2008 R2','Windows Server 2012','Windows Server 2012 R2','Windows Server 2016','Windows Server 2019'
        }
        Elseif($depcb.text -eq "UB")
        {
           $wincb.Enabled = $true
           $cb3.Enabled = $false
           $cb3.Text = '1'
           $cputb.Enabled = $false
           $ramtb.Enabled = $false
           $cputb.Text = '2'
           $ramtb.Text = '4096 MB'
           $winl.Text = "Appliance"
           $wincb.DataSource = '10.3.0','10.2.0','10.1.1','10.1.0','10.0.0','9.1.2','9.1.1','9.0.0-15' 
        }

       }
    $ipbox.Add_TextChanged({
        
    $gtcollect = @('192.168.197.', '192.168.139.','192.168.192.','10.159.5.','192.168.200.' )
        
    foreach ($gt in $gtcollect)
        {
            if($ipbox.Text -ilike $gt)
                {
                    if($ipbox.Text -ilike '192.168.200.'){$gtbox.Text = $gt + '3'}
                    elseif($ipbox.Text -ilike '10.159.5.'){$gtbox.Text = $gt + '2'}
                    else{$gtbox.Text = $gt + '1'}
                }
            if($ipbox.Text -ilike '10.159.*')
                {
                    $dnsbox.DataSource = '10.151.3.17','192.168.59.25' 
                }
            else
            { $dnsbox.Datasource = '192.168.20.100','192.168.20.168','10.151.3.17','192.168.59.25' }
            
        } 
        })
}


function Deploy($name, $ram, $path, $switch, $gen)
{
    $Form1.Controls.Remove($mod2)
    $Form1.Controls.Remove($labe2)
    $Form1.Controls.Remove($cb2)
    $Form1.Controls.Remove($tbst)
    $Form1.Controls.Remove($lst)
    $Form1.Controls.Remove($cb3)
    $Form1.Controls.Remove($lwin)
    $Form1.Controls.Remove($nwcb)
    $Form1.Controls.Remove($ledi)
    $Form1.Controls.Remove($Button2)
    $Form1.Controls.Remove($brl)
    $Form1.Controls.Remove($depcb)
    $Form1.Controls.Remove($depl)
    $Form1.Controls.Remove($wincb)
    $Form1.Controls.Remove($winl)
    $Form1.Controls.Remove($nametb)
    $Form1.Controls.Remove($namel)
    $Form1.Controls.Remove($ramtb)
    $Form1.Controls.Remove($cputb)
    $Form1.Controls.Remove($raml)
    $Form1.Controls.Remove($cpul)
    $Form1.Controls.Remove($Button3)
    $Form1.Controls.Remove($ipbox)
    $Form1.Controls.Remove($iplb)
    $Form1.Controls.Remove($gtlb)
    $Form1.Controls.Remove($gtbox)
    $Form1.Controls.Remove($dnslb)
    $Form1.Controls.Remove($dnsbox)
    $Form1.Controls.Add($deplb)
    $Form1.Controls.Add($cvmlb)
    $Form1.Controls.Add($startvm)
    $Form1.Controls.Add($nwl)
    $Form1.Controls.Add($donel)

    
    if($depcb.Text -eq "Virtual Machine")
    {
        Write-Host "Deploying VM"
        
        $t1 = Measure-Command {
        if($wincb.Text -eq "Windows Server 2019")
            {
                Write-Host "Copying 2019 DC VHD file"
                Copy-Item -Path '\\share\2019DC.vhdx' -Destination $path
                $vhdpath = $path+'\2019DC.vhdx'
                $deplb.Text =  "Deploying Windows Server 2019"
            }
        Elseif($wincb.Text -eq "Windows Server 2016")
            {
                Write-Host "Copying 2016 DC VHD file"
                Copy-Item -Path '\\share\2016DC.vhdx' -Destination $path
                $vhdpath = $path+'\2016DC.vhdx'
                $deplb.Text =  "Deploying Windows Server 2016"
            }
        Elseif($wincb.Text -eq "Windows Server 2012 R2")
            {
                Write-Host "Copying 2012 R2 STD VHD file"
                Copy-Item -Path '\\share\2012R2STD.vhdx' -Destination $path
                $vhdpath = $path+'\2012R2STD.vhdx'
                $deplb.Text =  "Deploying Windows Server 2012 R2"
            }
        Elseif($wincb.Text -eq "Windows Server 2012")
            {
                Write-Host "Copying 2012 R2 STD VHD file"
                Copy-Item -Path '\\share\2012.vhdx' -Destination $path
                $vhdpath = $path+'\2012.vhdx'
                $deplb.Text =  "Deploying Windows Server 2012"
            }
        Elseif($wincb.Text -eq "Windows Server 2008")
            {
                Write-Host "Copying 2008 VHD file"
                Copy-Item -Path '\\share\2008.vhdx' -Destination $path
                $vhdpath = $path+'\2008.vhdx'
                $deplb.Text =  "Deploying Windows Server 2008"
            }
        Elseif($wincb.Text -eq "Windows Server 2008 R2")
            {
                Write-Host "Copying 2008 R2 VHD file"
                Copy-Item -Path '\\share\2008R2.vhdx' -Destination $path
                $vhdpath = $path+'\2008R2.vhdx'
                $deplb.Text =  "Deploying Windows Server 2008 R2"
            }}
        CreateVM
        $t2 = Measure-Command {Set-VMIP}
        $time1 = $t1.TotalSeconds
        $time2 = $t2.TotalSeconds
        Statistics $time1 $time2

    }
    Elseif($depcb.Text -eq "Appliance")
    {
        Write-Host "Deploying Appliance"
        $t1 = Measure-Command {
        
        if($wincb.Text -eq "10.3.0")
            {
                $deplb.Text =  "Deploying Appliance 10.2.0"
                Write-Host "Copying 10.3.0 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 10.3.0"
            }
        Elseif($wincb.Text -eq "10.2.0")
            {
                $deplb.Text =  "Deploying Appliance 10.2.0"
                Write-Host "Copying 10.2.0 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 10.2.0"
            }
        Elseif($wincb.Text -eq "10.1.0")
            {
                $deplb.Text =  "Deploying Appliance 10.1.1"
                Write-Host "Copying 10.1.1 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 10.1.1"
            }
        Elseif($wincb.Text -eq "10.1.0")
            {
                $deplb.Text =  "Deploying Appliance 10.1.0"
                Write-Host "Copying 10.1.0 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 10.1.0"
            }
        Elseif($wincb.Text -eq "10.0.0")
            {
                $deplb.Text =  "Deploying Appliance 10.0.0"
                Write-Host "Copying 10.0.0 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 10.0.0"
            }
        Elseif($wincb.Text -eq "9.1.2")
            {
                $deplb.Text =  "Deploying Appliance 9.1.2"
                Write-Host "Copying 9.1.2 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 9.1.2"
            }
        Elseif($wincb.Text -eq "9.1.1")
            {
                $deplb.Text =  "Deploying Appliance 9.1.1"
                Write-Host "Copying 9.1.1 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 9.1.1"
            }
        Elseif($wincb.Text -eq "9.0.0-15")
            {
                $deplb.Text =  "Deploying Appliance 9.0.0-15"
                Write-Host "Copying 9.0.0-15 VHD file"
                Copy-Item -Path '\\share\Appliance_Hyper-V.vhd' -Destination $path
                $vhdpath = $path+'\Appliance_Hyper-V.vhd'
                $deplb.Text =  "Deploying Appliance 9.0.0-15"
            }
            }
        CreateVM
        $t2 = Measure-Command { Set-VMIP }
        $time1 = $t1.TotalSeconds
        $time2 = $t2.TotalSeconds
        Statistics $time1 $time2

    }  
}


function Set-VMIP
{
    Write-Host "Waiting for another 40 seconds"
    Sleep 60
    $nwl.Text = "Waiting for another 40 seconds"
     do
    {
        Write-Host "Waiting to set Network configuration"
        $nwl.Text = 'Waiting to set Network configuration..'
        if(((Get-VMNetworkAdapter $name).IPAddresses[0]) -ilike '169.254.*' -or ((Get-VMNetworkAdapter $name).IPAddresses[0]) -ilike '10.10.*')
        {
            Write-Host 'Setting IP..'
            Get-VMNetworkAdapter -VMName $name | Set-VMNetworkConfiguration -IPAddress ($ipbox.Text) -Subnet 255.255.255.0 -DefaultGateway ($gtbox.Text) -DNSServer ($dnsbox.Text)
        }
        if(((Get-VMNetworkAdapter $name).IPAddresses[0]) -eq $ipbox.Text)
        {
            Write-Host 'Done..'
            $donel.Text = 'Done !!'
            Break;
        }

        Sleep 10
    }while($true)
    
    if($depcb.Text -eq "UB")
    {
        $ip = ($ipbox.Text)
        $cmd = "/bin/sed -i s/10.10.10.1/"+$ip+"/g /etc/hosts"
        $p = echo y | .\plink.exe $ip -l root -pw unitrends1 $cmd
    }
}


function CreateVM
{
        if($depcb.Text -eq "Appliance")
        {
            Write-Host "Full vhd path - $vhdpath"
            Write-Host "Creating New VM"
            $cvmlb.Text = 'Creating VM'
            New-VM -Name $name -MemoryStartupBytes $ram -Path $path -SwitchName $switch -Generation $gen -VHDPath $vhdpath
            Write-Host 'Setting CPU'
            Get-VM -Name $name | Set-VM -ProcessorCount ($cputb.Text)
            Write-Host 'Adding internal disk 200GB'
            $newpath = $path + '\Internal.vhdx'
            New-VHD -SizeBytes 200GB -Dynamic -Path $newpath
            Get-VM -Name $name  | Add-VMHardDiskDrive -ControllerType SCSI -Path $newpath 
            if(((Get-VM $name).Name) -eq $name) {  $startvm.Text = 'Starting VM..'; Start-VM -Name $name; } else { (New-Object -ComObject Wscript.Shell).Popup("Error creating Virtual Machine Created",0,"Response Message",0);}
        }
        Elseif($depcb.Text -eq "Virtual Machine")
        {
            Write-Host "Full vhd path - $vhdpath"
            Write-Host "Creating New VM"
            $cvmlb.Text = 'Creating VM'
            New-VM -Name $name -MemoryStartupBytes $ram -Path $path -SwitchName $switch -Generation $gen -VHDPath $vhdpath
            Write-Host 'Setting CPU'
            Get-VM -Name $name | Set-VM -ProcessorCount ($cputb.Text) 
            if(((Get-VM $name).Name) -eq $name) {  $startvm.Text = 'Starting VM..'; Start-VM -Name $name; } else { (New-Object -ComObject Wscript.Shell).Popup("Error creating Virtual Machine Created",0,"Response Message",0);}
        }
        $Form1.Show()

}


function Statistics($time1, $time2)
{
    if($depcb.Text -eq "Appliance")
    {
        $system = (Test-Connection -ComputerName $env:computername -count 1).IPV4Address.ipaddressTOstring
        $date = Get-Date -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        New-Object -TypeName PSCustomObject -Property @{
        CONFIGURATION_TIME = $time2
        DEPLOYEMENT_TIME = $time1
        DATE = $date
        SYSTEM = $system
        DATASTORE = $path
        VM_NAME = $name
        OS = 'HYPV UB '+$wincb.Text
        ESX = $system
        } | Export-Csv -Path \\192.168.197.201\OVA\ubdeploy.csv -NoTypeInformation -Append -Encoding UTF8 -Delimiter ","
    }
    Elseif($depcb.Text -eq "Virtual Machine")
    {
        $system = (Test-Connection -ComputerName $env:computername -count 1).IPV4Address.ipaddressTOstring
        $date = Get-Date -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        New-Object -TypeName PSCustomObject -Property @{
        CONFIGURATION_TIME = $time2
        DEPLOYEMENT_TIME = $time1
        DATE = $date
        SYSTEM = $system
        DATASTORE = $path
        VM_NAME = $name
        OS = 'HYPV '+$wincb.Text
        ESX = $system
        } | Export-Csv -Path \\192.168.197.201\OVA\vmdeploy.csv -NoTypeInformation -Append -Encoding UTF8 -Delimiter ","
    }
}

$Form1.ShowDialog()