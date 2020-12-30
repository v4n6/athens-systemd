# Athens download-mode configuration file.
#
# See /usr/share/doc/athens/examples/download-mode.hcl.proto or https://docs.gomods.io/configuration/download
# for more examples and documentation.

# Defaults to redirecting all requests to proxy.golang.org.
downloadURL = "https://proxy.golang.org"

mode = "redirect"


# sync your github repo
# --------------------------------
# download "github.com/<your-name>/<your-private-repo>*" {
# 	mode = "sync"
# }

# sync your github repos
# --------------------------------
# download "github.com/<your-name>/*" {
# 	mode = "sync"
# }

# sync your repo
# --------------------------------
# download "<your-server>/<your-private-repo>*" {
# 	mode = "sync"
# }
