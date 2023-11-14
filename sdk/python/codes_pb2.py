# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: codes.proto
"""Generated protocol buffer code."""
from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='codes.proto',
  package='codes',
  syntax='proto3',
  serialized_options=b'Z\003go/\252\002\nCube.Codes',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x0b\x63odes.proto\x12\x05\x63odes*\xa0\x01\n\tCloseCode\x12\x0e\n\nDO_NOT_USE\x10\x00\x12\x10\n\x0bON_WAITLIST\x10\xf8#\x12\x13\n\x0eINCOMPLETE_KYC\x10\xf9#\x12\x13\n\x0eUNAPPROVED_KYC\x10\xfa#\x12\x10\n\x0b\x42\x41\x44_MESSAGE\x10\xdc$\x12\x11\n\x0cNO_HEARTBEAT\x10\xdd$\x12\x10\n\x0bUNSPECIFIED\x10\x87\'\"\x05\x08\x01\x10\x9f\x1f\"\t\x08\x88\'\x10\xff\xff\xff\xff\x07\x42\x12Z\x03go/\xaa\x02\nCube.Codesb\x06proto3'
)

_CLOSECODE = _descriptor.EnumDescriptor(
  name='CloseCode',
  full_name='codes.CloseCode',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='DO_NOT_USE', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ON_WAITLIST', index=1, number=4600,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='INCOMPLETE_KYC', index=2, number=4601,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='UNAPPROVED_KYC', index=3, number=4602,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='BAD_MESSAGE', index=4, number=4700,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='NO_HEARTBEAT', index=5, number=4701,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='UNSPECIFIED', index=6, number=4999,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=23,
  serialized_end=183,
)
_sym_db.RegisterEnumDescriptor(_CLOSECODE)

CloseCode = enum_type_wrapper.EnumTypeWrapper(_CLOSECODE)
DO_NOT_USE = 0
ON_WAITLIST = 4600
INCOMPLETE_KYC = 4601
UNAPPROVED_KYC = 4602
BAD_MESSAGE = 4700
NO_HEARTBEAT = 4701
UNSPECIFIED = 4999


DESCRIPTOR.enum_types_by_name['CloseCode'] = _CLOSECODE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)