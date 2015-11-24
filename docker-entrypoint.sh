#!/bin/bash

TEMPLATE_CONF_FILE=/etc/nginx/conf.d/default.conf.tpl
CONF_FILE=/etc/nginx/conf.d/default.conf

# first generate conf to forward to good backend (default is localhost:9000)

if [ "x$FORWARD_HOST" = "x" ]; then
	FORWARD_HOST=localhost
fi
if [ "x$FORWARD_PORT" = "x" ]; then
	FORWARD_PORT=9000
fi

sed -e "s/%%FORWARD_HOST%%/$FORWARD_HOST/gi" $TEMPLATE_CONF_FILE > $CONF_FILE
sed -e "s/%%FORWARD_PORT%%/$FORWARD_PORT/gi" -i $CONF_FILE

# execute the CMD part of dockerfile

exec "$@"
