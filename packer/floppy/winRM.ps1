$ErrorActionPreference = "Stop"

# 물리적 네트워크 어댑터와 연결된 프로필을 가져온다.
$profile = Get-NetConnectionProfile
# 네트워크 연결을 개인모드로 전환한다.(WinRM 방화벽 규칙에 필요합니다.)
Set-NetConnectionProfile -Name $profile.Name -NetworkCategory Private

winrm quickconfig -quiet
# WinRM 서비스에서 암호화되지 않은 데이터의 전송을 허용합니다.
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
# WinRM이 기본 인증을 사용하도록 설정합니다.
winrm set winrm/config/service/auth '@{Basic="true"}'

# Reset auto logon count
# https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup-autologon-logoncount#logoncount-known-issue
# 자동 로그인 횟수를 0으로 설정하여, 무인 설치 이후 자동로그인 설정을 해제합니다.
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoLogonCount -Value 0
