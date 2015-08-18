# To be sourced in a Bash shell
#
# Should be installed in $HOME/.local/share/aws-functions.sh

awsaccount() {
	local ACCOUNT=$1

	if [ -z "$1" ]; then
		echo "Usage: awsaccount ACCOUNT"
		return
	fi

	local FILENAME="$HOME/.config/aws-credentials-${ACCOUNT}.conf"

	if [ ! -f "$FILENAME" ]; then
		echo "No such account configuration: $ACCOUNT"
		return
	fi

	unset AWS_ACCESS_KEY
	unset AWS_SECRET_KEY
	unset AWS_ACCESS_KEY_ID
	unset AWS_SECRET_ACCESS_KEY

	. $FILENAME

	export AWS_ACCESS_KEY
	export AWS_SECRET_KEY

	# Some tools use different variable names
	export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY"
	export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_KEY"

	# Write config file
	cat > "$HOME/.config/aws-credentials.conf" <<EOF
# This file is auto generated, do not edit
# Credentials for account $ACCOUNT
AWSAccessKeyId=$AWS_ACCESS_KEY
AWSSecretKey=$AWS_SECRET_KEY
EOF
}
