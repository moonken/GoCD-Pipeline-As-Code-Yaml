if [[ -z "${GO_SERVER_URL}" ]]; then
    echo "#############################################################"
	echo "GO_SERVER_URL not set, use http://localhost:8153 as default"
	echo "#############################################################"
	GO_SERVER_URL=http://localhost:8153
fi

function encrypt {
	curl "$GO_SERVER_URL/go/api/admin/encrypt" \
		-u "$2:$3" \
		-H 'Accept: application/vnd.go.cd.v1+json' \
		-H 'Content-Type: application/json' \
		-X POST -d "{
		  "value": "$1"
		}"
}

if [ "$#" -eq 1 ]; then
  	if [[ -z "${GO_USER}" ]] || [[ -z "${GO_PASS}" ]]; then
    	echo "GO_USER and GO_PASS are not set, exit";
	else
	    encrypt $1 $GO_USER $GO_PASS
	fi
fi

if [ "$#" -eq 3 ]; then
    encrypt $1 $2 $3
fi




