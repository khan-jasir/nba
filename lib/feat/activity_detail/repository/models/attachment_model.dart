import 'package:dart_mappable/dart_mappable.dart';

part 'attachment_model.mapper.dart';

@MappableClass()
class AttachmentModel with AttachmentModelMappable {

  @MappableField(key: 'id')
  final String? id;
  @MappableField(key: 'fileName')
  final String? fileName;
  @MappableField(key: 'contentType')
  final String? contentType;
  @MappableField(key: 'fileUrl')
  final String? fileUrl;
  @MappableField(key: 'createdAt')
  final String? createdAt;
  @MappableField(key: 'updatedAt')
  final String? updatedAt;


  AttachmentModel({
    this.id,
    this.fileName,
    this.contentType,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
  });

}