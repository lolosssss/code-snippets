#!/bin/bash
#
# This program used to/for ...
#

set -e
#set -x

start_date=`date +"%F %T"`

cwd=`pwd`

main() {

}

main "$@"

end_date=`date +"%F %T"`

echo -e "\n[ Run \"$0\" Done. $starte_date ~ $end_date ]\n"

#set -x
set -e