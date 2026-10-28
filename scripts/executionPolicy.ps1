# Only relax the policy for the current user. Setting LocalMachine to AllSigned
# blocks every unsigned script for other scopes - pnpm.ps1, $PROFILE, and the
# oh-my-posh / fnm init all fail - so leave LocalMachine alone.
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
