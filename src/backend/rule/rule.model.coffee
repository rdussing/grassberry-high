async = require('async')
mongoose = require('mongoose')

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

ruleSchema = mongoose.Schema({
  device: String,
  detectorId: ObjectId
  forDetector: String,
  offValue: Number,
  onValue: Number,
  durationMSOn: Number #switch on for a duration if treshold is met
  sensor: {
    type: ObjectId,
    ref: 'Sensor',
    required: true
  }
  output: {
    type: ObjectId,
    ref: 'Output',
    required: true
  }
  unit: String
})

exports.getSchema = ()-> ruleSchema
exports.getModel = ()->
  try
    mongoose.model('Rule')
  catch err
    mongoose.model('Rule', ruleSchema)

