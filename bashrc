# Path to the AWS folder
AWSCM_PATH="$HOME/.awscm" #TODO: introspect this

#-------------------------------------------------------------------------------
# Credentials Function
#-------------------------------------------------------------------------------
function awscm {
    local credential_dir="${AWSCM_PATH}/$1"
    local credentials_file="${credential_dir}/credentials"

    if [[ ! -f $credentials_file ]]; then
        echo "Credentials for '$1' do not exist."
        return
    fi

    . $credentials_file

    if ls $credential_dir/*.pem 1> /dev/null 2>&1; then
        ssh-add $credential_dir/*.pem
    fi
}
