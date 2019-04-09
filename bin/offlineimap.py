#!/home/brettg/.guix-profile/bin/python3

from subprocess import check_output

def get_pass(account):
    raw_output = check_output("pass Mail/" + account, shell=True).splitlines()[0]
    return raw_output
