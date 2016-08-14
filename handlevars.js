#!/usr/bin/env node
const findHandlebarsVariables = require('@quarterto/find-handlebars-variables');
const fs = require('fs');

console.log(
	findHandlebarsVariables(
		fs.readFileSync(process.argv[2], 'utf8')
	).join(' ')
);
