import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/activity_detail_response_model.dart';

import 'models/models.dart';




abstract class ActivityDetailRepository {

Future<FetchCommentsModel> fetchComments(String taskId);
Future<void> deleteComment(String commentId, String taskId);
Future<void> addComment(List<PlatformFile> files, String content, String taskId);
Future<void> updateCommentAttachment(String attachmentId, String commentId, String taskId);
Future<void> updateComment(List<PlatformFile> files, String commentId, String taskId, String content);
Future<ActivityItemModel> fetchActivityDetail(String taskId);
}

class ActivityDetailRepositoryImpl extends ActivityDetailRepository {

  final Dio _client = Dio();

  final lan = '34.47.178.99';
  final agentId = 'SOS-000184';

  @override
  Future<ActivityItemModel> fetchActivityDetail(String taskId) async {
    try {
      final response = await _client.get(
        'http://$lan/nba/api/v1/task/$taskId/agent/$agentId',
      );
      if (response.statusCode == 200) {
        final ActivityDetailResponseModel activityDetails = ActivityDetailResponseModelMapper.fromMap(response.data);
        final activityItem = activityDetails.data?.toActivityItemModel(taskId);
        return activityItem ?? ActivityItemModel(id: taskId, taskName: '', taskDescription: '',);
      } else {
        throw Exception('Failed to load activity detail');
      }
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<FetchCommentsModel> fetchComments(String taskId) async {
    try {
      final response = await _client.get(
        'http://$lan/nba/api/v1/comment/task/$taskId',
      );
      if (response.statusCode == 200) {
        return FetchCommentsModelMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }

  @override
  Future<void> deleteComment(String commentId, String taskId) async {
    try {
      final response = await _client.delete(
        'http://$lan/nba/api/v1/comment/$commentId/task/$taskId'
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to delete comment');
      }
    } catch (e) {
      throw Exception('Failed to delete comment: $e');
    }
  }


  @override
  Future<void> addComment(List<PlatformFile> files, String content, String taskId) async {
    try {

      final List<MultipartFile> multipartFiles = [];
      for (final file in files) {
        print('[FilePickerDebug] Processing file: ${file.name}, path: ${file.path}, size: ${file.size}, bytes: ${file.bytes?.length}, identifier: ${file.identifier}');
        if (file.path != null && file.path!.isNotEmpty) {
          try {
            print('[FilePickerDebug] Attempting to create MultipartFile for path: ${file.path!}');
            multipartFiles.add(
              await MultipartFile.fromFile(file.path!, filename: file.name)
            );
            print('[FilePickerDebug] Successfully created MultipartFile for: ${file.path!}');
          } catch (e, s) {
            print('[FilePickerDebug] Error creating MultipartFile for ${file.name} (path: ${file.path}): $e\nStack trace: $s');
          }
        } else {
          print('[FilePickerDebug] Skipping file "${file.name}" due to missing or empty path. Has bytes: ${file.bytes != null}. Identifier: ${file.identifier}');
        }
      }
      
      print('[FilePickerDebug] Total multipart files prepared: ${multipartFiles.length} out of ${files.length} input files.');

      final formData = FormData.fromMap({
        'comment': MultipartFile.fromString(
          '{"content": "$content", "commentBy": "SOS-000184"}',
          contentType: MediaType.parse('application/json')
        ),
        'files': multipartFiles,
      });

    
      final response = await _client.request(
        'http://$lan/nba/api/v1/comment/task/$taskId',
        options: Options(
          method: 'POST',
        ),
        data: formData,
      );
      if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
        return;
      } else {
        throw Exception('Failed to add comment');
      }
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  @override
  Future<void> updateCommentAttachment(String attachmentId, String commentId, String taskId) async {
    try {
      final response = await _client.put(
        'http://$lan/nba/api/v1/comment/$commentId/task/$taskId?deleteDocumentIds=$attachmentId'
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to update comment attachment');
      }
    } catch(e) {
      throw Exception('Failed to update comment attachment: $e');
    }
  }
  
  @override
  Future<void> updateComment(List<PlatformFile> files, String commentId, String taskId, String content) async {
    try {
      final List<MultipartFile> multipartFiles = [];
      for (final file in files) {
        print('[FilePickerDebug] Processing file: ${file.name}, path: ${file.path}, size: ${file.size}, bytes: ${file.bytes?.length}, identifier: ${file.identifier}');
        if (file.path != null && file.path!.isNotEmpty) {
          try {
            print('[FilePickerDebug] Attempting to create MultipartFile for path: ${file.path!}');
            multipartFiles.add(
              await MultipartFile.fromFile(file.path!, filename: file.name)
            );
            print('[FilePickerDebug] Successfully created MultipartFile for: ${file.path!}');
          } catch (e, s) {
            print('[FilePickerDebug] Error creating MultipartFile for ${file.name} (path: ${file.path}): $e\nStack trace: $s');
          }
        } else {
          print('[FilePickerDebug] Skipping file "${file.name}" due to missing or empty path. Has bytes: ${file.bytes != null}. Identifier: ${file.identifier}');
        }
      }
      
      print('[FilePickerDebug] Total multipart files prepared: ${multipartFiles.length} out of ${files.length} input files.');

      final formData = FormData.fromMap({
        'comment': MultipartFile.fromString(
          '{"content": "$content", "commentBy": "SOS-000184"}',
          contentType: MediaType.parse('application/json')
        ),
        'files': multipartFiles,
      });

    
      final response = await _client.request(
        'http://$lan/nba/api/v1/comment/$commentId/task/$taskId',
        options: Options(
          method: 'PUT',
        ),
        data: formData,
      );
      if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
        return;
      } else {
        throw Exception('Failed to add comment');
      }
    } catch (e) {
      throw Exception('Failed to update comment: $e');
    }
  }
}
