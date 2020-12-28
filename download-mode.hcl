# Athens download-mode file
#
# See /usr/share/doc/athens/examples/download-mode.hcl or https://docs.gomods.io/configuration/download
# for more examples and documentation

# defaults to redirecting to proxy.golang.org
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
