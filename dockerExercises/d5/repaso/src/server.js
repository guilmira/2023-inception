const express = require("express");

const app = express();

app.listen(4000, () => {
    console.log("The motherfucking web server. Open http://localhost:3000");
});

app.get('/', async (req, res) => {
    res.send("Wingardium fucking leviosa");
});
