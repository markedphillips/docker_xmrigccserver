cat >> xmrigserver << EOF
XMRigCCServer 2.0.1-dev
Usage:
  /xmrigCC/xmrigServer [OPTION...]

  -b, --bind arg                The CC Server bind ip (default: 0.0.0.0)
  -p, --port N                  The CC Server port
  -U, --user arg                The CC Server admin user
  -P, --pass arg                The CC Server admin pass
  -T, --token arg               The CC Server access token for the CC Client
  -t, --tls                     Enable SSL/TLS support
  -K, --key-file FILE           The private key file to use when TLS is ON
                                (default: server.key)
  -C, --cert-file FILE          The cert file to use when TLS is ON (default:
                                server.pem)
  -B, --background              Run the Server in the background
  -S, --syslog                  Log to the syslog
      --no-colors               Disable colored output
      --pushover-user-key arg   The user key for pushover notifications
      --pushover-api-token arg  The api token/keytoken of the application for
                                pushover notification
      --telegram-bot-token arg  The bot token for telegram notifications
      --telegram-chat-id arg    The chat-id for telegram notifications
      --push-miner-offline-info
                                Push notification for offline miners and
                                recovery (default: true)
      --push-miner-zero-hash-info
                                Push notification when miner reports 0
                                hashrate and recovers (default: true)
      --push-periodic-mining-status
                                Push every hour a status notification
                                (default: true)
      --custom-dashboard FILE   The custom dashboard to use (default:
                                index.html)
      --client-config-folder FOLDER
                                The CC Server access token for the CC Client
      --log-file FILE           The log file to write
      --client-log-lines-history N
                                Maximum lines of log history kept per miner
                                (default: 100)
  -c, --config FILE             The JSON-format configuration file to use
  -h, --help                    Print this help
EOF

SECRET_TOKEN=""
PUSHOVER_USER=""
PUSHOVER_API=""
source .env
LOGFILE=./xmrigccserver.log
CC_USER=admin
CC_PASS=pass
CC_PORT=8989

alias docker_xmrigserver='docker run --rm -i -p ${CC_PORT}:${CC_PORT} -v ${PWD}:/data xmrigserver:latest xmrigserver'

function docker_cmd () {
 docker_xmrigserver \
  --port ${CC_PORT} \
  --user ${CC_USER} \
  --pass ${CC_PASS} \
  --token ${SECRET_TOKEN} \
  --pushover-user-key ${PUSHOVER_USER} \
  --pushover-api-token ${PUSHOVER_API} \
  --push-miner-offline-info \
  --push-miner-zero-hash-info \
  --push-periodic-mining-status \
  --log-file ${LOGFILE} \
  --syslog

}

function docker_config () {
  docker_xmrigserver --config=data/config_cc.json
}

docker_cmd
