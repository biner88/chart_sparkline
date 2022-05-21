
#/bin/bash
export PUB_HOSTED_URL=https://pub.dev
set https_proxy=127.0.0.1:10809
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
dart pub publish