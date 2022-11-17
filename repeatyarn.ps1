$jobs = @()

[string]$CONFIG_PATH = Get-Location
# 下面是应该创建的目录
$T_PATH = "\node_modules"
$My_PATH = "{0}{1}" -f $CONFIG_PATH, $T_PATH

[string]$TRUE_FALSE=(Test-Path $My_PATH)

while($TRUE_FALSE -eq "False")
{

    	$jobs += Start-ThreadJob -Name "yarnyourmun" -ScriptBlock {
		# 下面是拉取命令
      	yarn add vue
     }
    	Write-Host "Downloads started..."
	Wait-Job -Name "yarnyourmun" -Timeout 30
	$TRUE_FALSE=(Test-Path $My_PATH)
	Start-Sleep -Seconds 30

    
}