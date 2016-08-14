include node_modules/fait/index.mk

$(call require, ./)
$(call require, fait-doc)

fait-doc-header = doc/header.md
fait-doc-footer = doc/footer.md

main :: doc
