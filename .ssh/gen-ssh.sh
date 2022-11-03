# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# DO: change comment (email) as appropriate
# DO: name key as appropriate
ssh-keygen -t ed25519 -C "47658413+MaiMee1@users.noreply.github.com"

# DO: make sure ssh-agent is running
# eval "$(ssh-agent -s)"

# add key to agent
ssh-add ~/.ssh/id_ed25519

# copy public key
clip < ~/.ssh/id_ed25519.pub
