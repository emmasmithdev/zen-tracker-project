const express = require('express');
const parser = require('body-parser');
const MongoClient = require('mongodb').MongoClient;
const cors = require('cors');
const createRouter = require('./helpers/create_router.js');

const app = express();
app.use(parser.json());
app.use(cors());

MongoClient.connect('mongodb://localhost:27017')
.then((client) => {
  const db = client.db('carbon_data');
  const carbonCollection = db.collection('footprint');
  const carbonRouter = createRouter(carbonCollection);
  app.use('/api/footprint', carbonRouter);
});

app.listen(3000, function () {
  console.log(`Listening on port ${ this.address().port }`);
});
