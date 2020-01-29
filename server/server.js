const express = require('express');
const parser = require('body-parser');
const MongoClient = require('mongodb').MongoClient;
const cors = require('cors');
const createRouter = require('./helpers/create_router.js');
const port = process.env.PORT || 3000

const app = express();
app.use(parser.json());
app.use(cors());

MongoClient.connect('mongodb://heroku_1kf5x7pr:m8rm31bdj5e28p43av5pr9pua5@ds151007.mlab.com:51007/heroku_1kf5x7pr')
.then((client) => {
  const db = client.db('carbon_data');
  const carbonCollection = db.collection('footprint');
  const carbonRouter = createRouter(carbonCollection);
  app.use('/api/footprint', carbonRouter);
});

app.listen(port, function () {
  console.log(`Server started on port`, port);
});


// ${ this.address().port }
// mongodb://localhost:27017
