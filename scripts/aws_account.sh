#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

function get_account() {
	account="none"

	if [[ -n $AWS_ACCOUNT_ID ]]; then
		account="n/a"
	fi

	if [[ "499701895798" == $AWS_ACCOUNT_ID ]]; then
		account="authy.prod"
	fi

	if [[ "882730218587" == $AWS_ACCOUNT_ID ]]; then
		account="authy.dev"
	fi

	if [[ "959786279523" == $AWS_ACCOUNT_ID ]]; then
		account="authy.stage"
	fi


	echo $account
}

main() {
  # storing the refresh rate in the variable RATE, default is 5
  aws_label=$(get_tmux_option "@dracula-aws-label" "󰸏")
  aws_account=$(get_account)
  echo "$aws_label $aws_account"
}

# run main driver
main
