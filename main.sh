#!/bin/sh
for VARIABLE in 1 2 3 4 5
do
	echo "Enter desired command - Options are getbalance, newaddress, sendbitcoins and listunspend"
	read command
	case $command in
		getbalance)
		bitcoin-cli -regtest getbalance
		;;
		newaddress)
		NEW_ADDRESS=$(bitcoin-cli -regtest getnewaddress)
		echo $NEW_ADDRESS
		;;
		sendbitcoins)
		bitcoin-cli -regtest sendtoaddress $NEW_ADDRESS 10.00
		;;
		listunspend)
		bitcoin-cli -regtest listunspent 0
		;;
		*)
		echo error wrong input
		;;
	esac
done
