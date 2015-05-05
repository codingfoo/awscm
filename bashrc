# Path to the AWS folder
AWS_PATH="$HOME/.awscm" #TODO: introspect this

#-------------------------------------------------------------------------------
# Credentials Function
#-------------------------------------------------------------------------------
function awscm {
    local credential_dir="${AWS_PATH}/$1"
    local credentials_file="${credential_dir}/credentials"

    if [[ ! -f $credentials_file ]]; then
        echo "Credentials for '$1' do not exist."
        return
    fi

    . $credentials_file
    ssh-add $credential_dir/*.pem
}
