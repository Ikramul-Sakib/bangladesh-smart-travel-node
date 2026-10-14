const fs=require('fs');const path=require('path');const root=path.join(__dirname,'..');
const required=['server.js','src/db.js','src/routes.js','views/home.ejs','views/planner.ejs','views/auth.ejs','public/css/style.css','public/js/app.js'];
let bad=false;for(const f of required){if(!fs.existsSync(path.join(root,f))){console.error('Missing:',f);bad=true}else console.log('OK',f)}if(bad)process.exit(1);console.log('Project structure looks complete.');
