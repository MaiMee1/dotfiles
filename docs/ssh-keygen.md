# SSH key setup

Per GitHub's [guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

```sh
# Change the comment and file name as appropriate (e.g. id_ed25519_<alias> for a second account).
ssh-keygen -t ed25519 -C "47658413+MaiMee1@users.noreply.github.com"

# Make sure ssh-agent is running (Windows: Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy the public key, then add it at https://github.com/settings/keys
clip < ~/.ssh/id_ed25519.pub   # macOS: pbcopy < ~/.ssh/id_ed25519.pub

# Check
ssh -T git@github.com
```
