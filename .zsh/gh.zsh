# GitHub CLI helpers

# skjold-prs: fuzzy-pick your open review-requested PRs and open in browser.
# Consumes the `gh team-prs` alias which emits tab-separated columns:
#   REPO<TAB>ID<TAB>TITLE<TAB>UPDATED<TAB>URL
# fzf hides the URL column; Enter opens the highlighted PR, Tab multi-selects.
# Requires: gh (with `team-prs` alias) and fzf. Optional args: <owner> <limit>.
skjold-prs() {
    local owner="${1:-techcloud0}" limit="${2:-30}"
    op plugin run -- gh team-prs "$owner" open @me "$limit" \
        | fzf --multi --ansi --with-nth=1,2,3,4 --delimiter='\t' \
              --header='Enter: open in browser | Tab: multi-select | Ctrl-C: cancel' \
              --preview 'echo {5}' --preview-window=down,1,wrap \
        | while IFS=$'\t' read -r _repo _id _title _updated url; do
            [ -n "$url" ] && open "$url"
          done
}
