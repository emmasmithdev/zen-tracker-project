const express = require('express');
const ObjectId = require('mongodb').ObjectID;

const createRouter = function (collection) {

//INDEX
  const router = express.Router();
  router.get('/', (req, res) => {
    collection
    .find()
    .toArray()
    .then(docs => res.json(docs))
    .catch((error) => {
      console.error(error);
      res.status(500);
      res.json({status: 500, error: error})

    })
  });

//SHOW
  router.get('/:id', (req, res) => {
    const id = ObjectId(req.params.id);
    collection.findOne({_id: id})
    .then(doc => res.json(doc))
  });

//CREATE
  router.post('/', (req, res) => {
    const newFootprint = req.body;
    collection.insertOne(newFootprint)
      .then((result) => {
        res.json(result.ops[0])})
      .catch((error) => {
        console.error(error);
        res.status(500);
        res.json({status: 500, error: error})
      });
    });

//DELETE
    router.delete('/:id', (req, res) => {
      const id = ObjectId(req.params.id);
      collection.deleteOne({_id: id})
        .then(result => res.json(result))
        .catch((error) => {
          console.error(error);
          res.status(500);
          res.json({status: 500, error: error})
        });
    });

//UPDATE
    router.put('/:id', (req, res) => {
      const id = ObjectId(req.params.id);
      const updatedData = req.body;
        collection.findOneAndUpdate(
          {_id: id},
          {$set: updatedData},
          {returnOriginal: false}
        )
          .then(result => res.json(result.value))
          .catch((error) => {
            console.error(error);
            res.status(500);
            res.json({status: 500, error: error})
            });
      });

  return router;
};

module.exports = createRouter;
