// Wraps www/app.html (the app source, also used for the web preview) into a full www/index.html for the Android app.
const fs = require("fs");
const path = require("path");
const src = fs.readFileSync(path.join(__dirname, "..", "www", "app.html"), "utf8");
const html = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}</style>
</head>
<body>
${src}
</body>
</html>
`;
fs.writeFileSync(path.join(__dirname, "..", "www", "index.html"), html);
console.log("www/index.html written");
