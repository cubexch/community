// source: codes.proto
/**
 * @fileoverview
 * @enhanceable
 * @suppress {missingRequire} reports error on implicit type usages.
 * @suppress {messageConventions} JS Compiler reports an error if a variable or
 *     field starts with 'MSG_' and isn't a translatable message.
 * @public
 */
// GENERATED CODE -- DO NOT EDIT!
/* eslint-disable */
// @ts-nocheck

var jspb = require('google-protobuf');
var goog = jspb;
var global = Function('return this')();

goog.exportSymbol('proto.codes.CloseCode', null, global);
/**
 * @enum {number}
 */
proto.codes.CloseCode = {
  DO_NOT_USE: 0,
  ON_WAITLIST: 4600,
  INCOMPLETE_KYC: 4601,
  UNAPPROVED_KYC: 4602,
  BAD_MESSAGE: 4700,
  NO_HEARTBEAT: 4701,
  UNSPECIFIED: 4999
};

goog.object.extend(exports, proto.codes);
