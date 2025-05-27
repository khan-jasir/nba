// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attachment_model.dart';

class AttachmentModelMapper extends ClassMapperBase<AttachmentModel> {
  AttachmentModelMapper._();

  static AttachmentModelMapper? _instance;
  static AttachmentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttachmentModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttachmentModel';

  static String? _$id(AttachmentModel v) => v.id;
  static const Field<AttachmentModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$fileName(AttachmentModel v) => v.fileName;
  static const Field<AttachmentModel, String> _f$fileName =
      Field('fileName', _$fileName, opt: true);
  static String? _$contentType(AttachmentModel v) => v.contentType;
  static const Field<AttachmentModel, String> _f$contentType =
      Field('contentType', _$contentType, opt: true);
  static String? _$fileUrl(AttachmentModel v) => v.fileUrl;
  static const Field<AttachmentModel, String> _f$fileUrl =
      Field('fileUrl', _$fileUrl, opt: true);
  static String? _$createdAt(AttachmentModel v) => v.createdAt;
  static const Field<AttachmentModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$updatedAt(AttachmentModel v) => v.updatedAt;
  static const Field<AttachmentModel, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<AttachmentModel> fields = const {
    #id: _f$id,
    #fileName: _f$fileName,
    #contentType: _f$contentType,
    #fileUrl: _f$fileUrl,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static AttachmentModel _instantiate(DecodingData data) {
    return AttachmentModel(
        id: data.dec(_f$id),
        fileName: data.dec(_f$fileName),
        contentType: data.dec(_f$contentType),
        fileUrl: data.dec(_f$fileUrl),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static AttachmentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttachmentModel>(map);
  }

  static AttachmentModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttachmentModel>(json);
  }
}

mixin AttachmentModelMappable {
  String toJson() {
    return AttachmentModelMapper.ensureInitialized()
        .encodeJson<AttachmentModel>(this as AttachmentModel);
  }

  Map<String, dynamic> toMap() {
    return AttachmentModelMapper.ensureInitialized()
        .encodeMap<AttachmentModel>(this as AttachmentModel);
  }

  AttachmentModelCopyWith<AttachmentModel, AttachmentModel, AttachmentModel>
      get copyWith =>
          _AttachmentModelCopyWithImpl<AttachmentModel, AttachmentModel>(
              this as AttachmentModel, $identity, $identity);
  @override
  String toString() {
    return AttachmentModelMapper.ensureInitialized()
        .stringifyValue(this as AttachmentModel);
  }

  @override
  bool operator ==(Object other) {
    return AttachmentModelMapper.ensureInitialized()
        .equalsValue(this as AttachmentModel, other);
  }

  @override
  int get hashCode {
    return AttachmentModelMapper.ensureInitialized()
        .hashValue(this as AttachmentModel);
  }
}

extension AttachmentModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttachmentModel, $Out> {
  AttachmentModelCopyWith<$R, AttachmentModel, $Out> get $asAttachmentModel =>
      $base.as((v, t, t2) => _AttachmentModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AttachmentModelCopyWith<$R, $In extends AttachmentModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? fileName,
      String? contentType,
      String? fileUrl,
      String? createdAt,
      String? updatedAt});
  AttachmentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttachmentModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttachmentModel, $Out>
    implements AttachmentModelCopyWith<$R, AttachmentModel, $Out> {
  _AttachmentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttachmentModel> $mapper =
      AttachmentModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? fileName = $none,
          Object? contentType = $none,
          Object? fileUrl = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (fileName != $none) #fileName: fileName,
        if (contentType != $none) #contentType: contentType,
        if (fileUrl != $none) #fileUrl: fileUrl,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  AttachmentModel $make(CopyWithData data) => AttachmentModel(
      id: data.get(#id, or: $value.id),
      fileName: data.get(#fileName, or: $value.fileName),
      contentType: data.get(#contentType, or: $value.contentType),
      fileUrl: data.get(#fileUrl, or: $value.fileUrl),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  AttachmentModelCopyWith<$R2, AttachmentModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttachmentModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
