
all: prep build generate lint

prep: prep_build prep_lint prep_generate

##########

prep_generate:
	npm install --prefix .tools/node html-minifier

generate:
	hugo --baseURL $(DEPLOY_URL)
	.tools/node/node_modules/html-minifier/cli.js --input-dir public --output-dir public --file-ext html --collapse-whitespace --minify-js --minify-css --sort-attributes --sort-class-name --remove-attribute-quotes --remove-comments

##########

prep_build:
	npm install --prefix .tools/node sass
	npm install --prefix .tools/node uglify-js

build:
	.tools/node/node_modules/sass/sass.js src/sass/light_theme_archive.scss static/css/light_theme_archive.css -s compressed
	.tools/node/node_modules/sass/sass.js src/sass/light_theme_normal.scss static/css/light_theme_normal.css -s compressed
	.tools/node/node_modules/sass/sass.js src/sass/light_theme_preliminary.scss static/css/light_theme_preliminary.css -s compressed
	.tools/node/node_modules/sass/sass.js src/sass/dark_theme_archive.scss static/css/dark_theme_archive.css -s compressed
	.tools/node/node_modules/sass/sass.js src/sass/dark_theme_normal.scss static/css/dark_theme_normal.css -s compressed
	.tools/node/node_modules/sass/sass.js src/sass/dark_theme_preliminary.scss static/css/dark_theme_preliminary.css -s compressed
	.tools/node/node_modules/uglify-js/bin/uglifyjs src/js/misc.js src/js/prism.js --mangle --compress -o static/js/all.min.js
	.tools/node/node_modules/uglify-js/bin/uglifyjs src/js/styleSwitcher.js --mangle --compress -o static/js/styleSwitcher.min.js

##########

