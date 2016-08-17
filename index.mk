$(register-npm-bin)

~this-module-dir := $(~module-dir)

define ~fait-macro-data-args
$(patsubst %, -f %, $(call filter-match,.json, $(1)))
endef

define ~fait-macro-template-arg
$(patsubst %, -t %, $(call filter-match,.hbs, $(1)))
endef

# Compile a makefile from a Handlebars template with data from makefile vars.
%.mk: %.hbs %.mk.json
	handlebars-macro $(call ~fait-macro-data-args, $^) $(call ~fait-macro-template-arg, $^) -o $@

# Generate an intermediate json file of makefile variables by exporting the names
# found in the Handlebars template
%.mk.json: %.hbs $$(call filter-out-match,$$*.mk, $(MAKEFILE_LIST))
	$(call export-variables, $(shell $(~this-module-dir)handlevars.js $<))
	env-vars-to-json > $@
