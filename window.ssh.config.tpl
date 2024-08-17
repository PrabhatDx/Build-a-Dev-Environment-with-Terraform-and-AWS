add-content -path c:/users/prabh/.ssh/config -value @'

Host $(hostname)
  HostName $(hostname)
  User $(user)
  IdentityFile $(identityfile)
  '@