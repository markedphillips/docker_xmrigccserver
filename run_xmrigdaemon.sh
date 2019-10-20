cat >> xmrigdaemon << EOF
sage: XMRigCC [OPTIONS]
Options:
  -a, --algo=ALGO                   specify the algorithm to use
                                      cn/r, cn/2, cn/1, cn/0, cn/double, cn/half, cn/fast,
                                      cn/rwz, cn/zls, cn/xao, cn/rto, cn/conceal,
                                      cn-lite/1,
                                      cn-heavy/xhv, cn-heavy/tube, cn-heavy/0,
                                      cn-pico
                                      cn-extremelite
                                      argon2/chukwa, argon2/wrkz
                                      rx/wow, rx/loki
  -o, --url=URL                     URL of mining server
  -O, --userpass=U:P                username:password pair for mining server
  -u, --user=USERNAME               username for mining server
  -p, --pass=PASSWORD               password for mining server
      --rig-id=ID                   rig identifier for pool-side statistics (needs pool support)
  -t, --threads=N                   number of miner threads
  -v, --av=N                        algorithm variation, 0 auto select
  -k, --keepalive                   send keepalived packet for prevent timeout (needs pool support)
      --nicehash                    enable nicehash.com support
      --tls                         enable SSL/TLS support (needs pool support)
      --tls-fingerprint=F           pool TLS certificate fingerprint, if set enable strict certificate pinning
      --daemon                      use daemon RPC instead of pool for solo mining
      --daemon-poll-interval=N      daemon poll interval in milliseconds (default: 1000)
  -r, --retries=N                   number of times to retry before switch to backup server (default: 5)
  -R, --retry-pause=N               time to pause between retries (default: 5)
      --cpu-affinity                set process affinity to CPU core(s), mask 0x3 for cores 0 and 1
      --cpu-priority                set process priority (0 idle, 2 normal to 5 highest)
      --no-huge-pages               disable huge pages support
      --no-color                    disable colored output
      --donate-level=N              donate level, default 5% (5 minutes in 100 minutes)
      --user-agent                  set custom user-agent string for pool
  -B, --background                  run the miner in the background
  -c, --config=FILE                 load a JSON-format configuration file
  -l, --log-file=FILE               log all output to a file
  -S, --syslog                      use system log for output messages
      --asm=ASM                     ASM optimizations, possible values: auto, none, intel, ryzen, bulldozer.
      --print-time=N                print hashrate report every N seconds
      --api-worker-id=ID            custom worker-id for API
      --api-id=ID                   custom instance ID for API
      --http-enabled                enable HTTP API
      --http-host=HOST              bind host for HTTP API (default: 127.0.0.1)
      --http-port=N                 bind port for HTTP API
      --http-access-token=T         access token for HTTP API
      --http-no-restricted          enable full remote access to HTTP API (only if access token set)
      --randomx-init=N              threads count to initialize RandomX dataset
      --randomx-no-numa             disable NUMA support for RandomX
      --export-topology             export hwloc topology to a XML file and exit
      --cc-disabled                 disable CC Client feature
      --cc-url=URL                  url of the CC Server
      --cc-access-token=T           access token for CC Server
      --cc-worker-id=ID             custom worker-id for CC Server
      --cc-update-interval-s=N      status update interval in seconds (default: 10 min: 1)
      --cc-use-tls                  enable tls encryption for CC communication
      --cc-use-remote-logging       enable remote logging on CC Server
      --cc-upload-config-on-start   upload current miner config to CC Server on startup
      --cc-reboot-cmd=CMD           command/bat to execute to Reboot miner machine
      --dry-run                     test configuration and exit
  -h, --help                        display this help and exit
  -V, --version                     output version information and exit
EOF

alias docker_xmrigdaemon='docker run --rm -i -p 8989:8989 -v ${pwd}:/xmrigcc xmrigserver:latest xmrigdaemon'
docker_xmrigdaemon -h
